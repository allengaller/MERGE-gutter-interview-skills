# Topic · RAG 全链路

> 给 interview-coach skill 加载。
> 主路径 + 每个环节的坑 + 关键 trade-off。

---

## 主路径：用户问"我们的 SLO 是多少"

```
用户问题
"我们生产环境的 SLO 是多少？"
  │
  ▼
┌──────────────┐
│ Query 预处理 │ → 改写 / 扩写 / 提取实体
└──────┬───────┘
       ▼
┌──────────────┐
│ Chunking     │ → 文档已经在库里被切好了
└──────┬───────┘
       ▼
┌──────────────┐
│ Embedding    │ → 把 query 变成向量
└──────┬───────┘
       ▼
┌──────────────┐
│ 向量检索      │ → top-K 个候选 chunk
└──────┬───────┘
       ▼
┌──────────────┐
│ Rerank       │ → 用更精准的模型重排
└──────┬───────┘
       ▼
┌──────────────┐
│ LLM 生成    │ → 把 top chunks + query 给 LLM 总结
└──────┬───────┘
       ▼
答案 + 引用
```

## 每个环节的细节和坑

### 1. Chunking（最容易出问题）

#### 按什么切？

| 策略 | 优点 | 缺点 | 适用场景 |
|------|------|------|---------|
| **按 token 硬切** | 简单、固定大小 | 切断语义、答案不完整 | **生产慎用** |
| **按段落** | 语义完整 | chunk 大小不一 | 通用文档 |
| **按 section** | 标题语义清晰 | section 长短不一 | 文档 / runbook |
| **按句子** | 粒度细 | 缺上下文 | FAQ |
| **按语义块** | 最佳语义 | 实现复杂、向量化贵 | 关键路径 |
| **Sliding Window** | 重叠覆盖 | 存储贵 | 法律 / 医疗 |

#### 关键参数
- **chunk size**：300-500 tokens 是常见甜蜜点
- **overlap**：10-20%（防止切断实体）
- **metadata**：source / section / url / 时间戳都要存（用于过滤 + 引用）

#### 关键 trade-off
- **大 chunk**：上下文全，但召回粒度粗（可能把无关内容也塞进 prompt）
- **小 chunk**：召回精准，但可能缺上下文（答案不全）
- **重叠**：避免切断，但存储 + 检索成本上升

#### 实战经验（用户场景）
- runbook 场景 → 按 **section** 切（每个故障处理步骤自包含）
- 代码片段 → 按 **函数 / 类** 切
- 法律文档 → **滑动窗口**（不允许切断条款）

### 2. Embedding 模型

#### 主流模型对比

| 模型 | 维度 | 优势 | 适用 |
|------|------|------|------|
| OpenAI text-embedding-3 | 1536 / 3072 | 通用稳 | 通用 |
| BGE-M3 | 1024 | 中文好 | 中文为主 |
| m3e | 768 | 轻量 | 个人/小团队 |
| Cohere embed-v3 | 1024 | 多语言 | 国际化 |
| 本地 bge-small | 384 | 完全离线 | 隐私场景 |

#### 关键 trade-off
- **维度高** → 精度高但存储贵
- **MTEB 排名** 是参考但**不是银弹**（领域相关）
- **升级 embedding 模型** 要回填所有数据，是大工程

### 3. 向量库

#### 主流选型

| 向量库 | 类型 | 优势 |
|--------|------|------|
| **Milvus** | 独立 | 大规模生产级 |
| **Qdrant** | Rust | 性能好 |
| **pgvector** | Postgres 插件 | 简单、不引入新组件 |
| **Weaviate** | Go | 模块化、内置 hybrid |
| **Chroma** | Python | 轻量、demo 用 |

#### 关键 trade-off
- **独立向量库 vs pgvector**：
  - pgvector：少一个组件，但要 tradeoff Postgres 性能
  - 独立：横向扩灵活，但要管运维
- **存到向量库 vs 自建倒排索引**：
  - < 100w 文档：pgvector / Chroma 都行
  - > 1 亿：Milvus / Weaviate / 阿里 DashVector

### 4. 检索策略

#### 三种检索

| 策略 | 适合 | 优势 | 劣势 |
|------|------|------|------|
| **纯向量** | 语义模糊查询 | 召回"看起来不同但意思一样" | 漏"exact match"（型号 / ID） |
| **BM25 / 全文** | 精确词查询 | 命中数字 / 型号 / 专有名词 | 漏"同义但不同词" |
| **混合（hybrid）** | 生产通用 | 两者互补 | 实现稍复杂 |

#### 实战经验
- **生产默认走 hybrid**——除非确定场景非常单一
- **权重**：向量 0.7 + BM25 0.3 是常见配比

### 5. Rerank

#### 三种 rerank

1. **BM25 二次打**（免费，轻量改进）
2. **Cross-encoder rerank**（常用，中等开销）
   - BGE-reranker / Cohere rerank
3. **LLM rerank**（贵但准，关键路径用）

#### 关键 trade-off
- **不上 rerank**：召回 top-20 给 LLM，但 LLM 上下文有限，噪声多
- **上一档 rerank**：top-5 更准，但慢 + 贵
- **实战**：粗排 top-50 → 精排 top-5

### 6. LLM 生成

#### Prompt 模板
```
你是 {role}。基于以下文档回答用户问题。

规则：
1. 只用提供的文档信息，不要补充文档里没有的内容
2. 如果文档里没有答案，明确说"我不知道"
3. 答案里要标 [引用 1] 这种引用

文档：
[1] {chunk_1}
[2] {chunk_2}
...

用户问题：{query}
```

#### 关键 trade-off
- **citation 强制**：要不要 LLM 必须引用？
  - 是 → 信任度高，但 LLM 可能"硬引"（编引用）
  - 否 → 灵活，但难以追溯
- **"不知道"明确化**：降低幻觉，但用户体感"AI 菜"

## 评估体系（最关键）

### 关键指标

| 指标 | 衡量 | 及格线 |
|------|------|--------|
| **Retrieval Recall@K** | top-K 中包含 ground truth 的比率 | > 0.8 |
| **Answer Accuracy** | 最终答案正确 | > 0.85 |
| **Hallucination Rate** | 编造信息比率 | < 0.1 |
| **Citation Accuracy** | 引用对得上 | > 0.9 |
| **Latency P95** | 端到端 | < 2s |

### Eval Set 建设
- **Ground truth 构造**：人工标注 + 历史 case
- **自动化**：LLM-as-judge + rule 规则
- **频率**：每次 prompt / chunking 改动都跑

### 经典坑
- **"我的 eval 在 demo 数据上 95%！"** — 可能 overfit
- **"retrieval recall 100% 但 answer 30%"** — LLM 没用好检索结果（prompt 问题）

## 性能优化

### 1. 缓存
- **Query cache**：相同 query 直接复用结果
- **Embedding cache**：相同文本不重算（key 用 hash）
- **Result cache**：高频 chunk 缓存

### 2. 增量更新
- **问题**：文档变了，向量库怎么办？
- **方案**：
  - 整篇重新 embedding（简单但贵）
  - 增量 embedding（只改动了的）
  - 版本化 + 灰度切换

### 3. 并行化
- Embedding 计算 → 用 batch
- 多个 query → 并发
- Rerank → 提前并行启动

## 关键 trade-off（面试必聊）

### 1. Chunking 精度 vs 召回
- **chunk 大**：单 chunk 命中率高，但召回宽泛
- **chunk 小**：精准召回，但可能漏上下文
- **业界**：用 hybrid size（小 chunk for retrieval，大 chunk for context）

### 2. 检索速度 vs 准确
- **HNSW**：向量库默认算法，速度快但 recall 略低
- **IVF**：聚类搜索，速度更快但 recall 低
- **实战**：HNSW + rerank 是平衡点

### 3. Rerank 收益 vs 成本
- 不上 rerank：recall 100% 用了，但 LLM 上下文成本高
- 上 rerank：top-5 给 LLM，成本低
- **判断**：< 1 亿文档可不上 rerank

### 4. 长上下文 vs RAG
- **趋势**：模型上下文越来越大（128k → 1M）
- **争议**：RAG 还要不要？
- **答案**：还是要。RAG 比长上下文更精准、更便宜、更可控

## 常见误区（90% 候选人栽）

- ❌ "按 token 硬切 chunk 就够了"——其实切断语义是头号杀手
- ❌ "embedding 模型用最新的就行"——其实要看领域相关性，回填成本也巨大
- ❌ "向量召回越相似越好"——其实要 hybrid + rerank
- ❌ "LLM 不引用也能给答案"——其实必须强制引用，不然就是幻觉
- ❌ "RAG 是 over-engineering"——其实在 2024 年仍是 AI 应用的主力架构

## 面试钩子

**及格线**：能讲清以下任一题 → Senior
- "chunking 怎么选，为什么不能按 token 硬切"
- "hybrid 检索为什么比纯向量好"
- "召回 100% 但答案不对是什么原因"
- "embedding 模型升级怎么回填"

**加分项**：
- 设计过 hybrid retrieval pipeline
- 做过 eval 体系（不只看 demo）
- 谈过 long context vs RAG 的取舍

**追问方向**：
- "你的 chunking 策略是什么？为什么？"
- "你的 eval 集怎么建？"
- "embedding 升级成本怎么算？"

---

**维护者注**：本文档每半年 review 一次。Embedding 模型和向量库演进快。
