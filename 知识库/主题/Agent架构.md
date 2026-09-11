# Topic · Agent 架构模式

> 给 interview-coach skill 加载。
> 主路径 + 核心循环 + 失败模式 + 关键 trade-off。

---

## 主路径：用户提问到 Agent 给出答案

```
用户问题
  │
  ▼
┌────────────────┐
│  System Prompt │ ← 角色定义 + 工具列表 + 输出格式
└────────┬───────┘
         ▼
┌──────────────────────────────────┐
│  Core Loop (ReAct / Plan-Act-Reflect) │
│  ┌─────────┐                     │
│  │  PLAN   │ → 推理"我需要什么工具" │
│  └────┬────┘                     │
│       ▼                           │
│  ┌─────────┐                     │
│  │  ACT    │ → 调用工具          │
│  └────┬────┘                     │
│       ▼                           │
│  ┌─────────┐                     │
│  │ OBSERVE │ → 工具返回结果       │
│  └────┬────┘                     │
│       ▼                           │
│  ┌─────────┐                     │
│  │ REFLECT │ → 评估是否足够       │
│  └────┬────┘                     │
│       └────→ 回到 PLAN 或结束    │
└────────────┬─────────────────────┘
             ▼
       最终答案给用户
```

## 核心循环模式

### 1. ReAct（最经典）
- **思路**：Reasoning + Acting 交错
- **伪代码**：
  ```
  thought: "用户问数据库连接信息，我需要查 config"
  action: query_config(service="db")
  observation: "host=db.x, port=5432"
  thought: "现在够了"
  answer: "host=db.x, port=5432"
  ```
- **优势**：可观察、可调试、容易解释
- **劣势**：循环次数多，token 贵

### 2. Plan-Act-Reflect
- **思路**：先规划（plan）→ 执行（act）→ 反思（reflect）
- **关键差异**：先完整 plan，再 act（避免边走边错）
- **代表**：ReWOO、Plan-and-Execute
- **优势**：更可控、可优化 plan
- **劣势**：plan 错了整个跑偏

### 3. Reflexion
- **思路**：加一层"自我反思"，失败时存到 long-term memory
- **代表**：Reflexion paper
- **适用**：多轮迭代型任务（代码生成）

### 4. Multi-Agent
- **思路**：多个 agent 协同（manager / worker / critic 模式）
- **代表**：AutoGPT、MetaGPT、LeetCast（主持人 + 嘉宾）
- **优势**：分工、可扩展
- **关键坑**：agent 间通信、循环跑偏、token 暴涨

## 工具调用协议

### Function Calling（OpenAI 风格）
```json
{
  "name": "query_database",
  "description": "查询 PostgreSQL 数据库",
  "parameters": {
    "type": "object",
    "properties": {
      "sql": { "type": "string" },
      "limit": { "type": "integer", "default": 100 }
    },
    "required": ["sql"]
  }
}
```
- **关键**：description 是 LLM 理解的依据，写得越清楚越好

### MCP（Model Context Protocol，Anthropic 2024）
- **统一标准**：让工具跨 agent 框架复用
- **架构**：MCP Host（agent）↔ MCP Client ↔ MCP Server（工具实现）
- **优势**：一次注册，到处用
- **劣势**：工具描述仍占 token，需要优化

## 失败模式（AI Agent 最关键的工程话题）

### 1. 工具调用失败
- **transient**（重试可解）：网络抖动、timeout、5xx
- **permanent**（重试无解）：404、参数错误、权限拒绝
- **partial**（部分成功）：某些工具返回了数据，某些没

**应对**：
- transient：指数退避 + 最多 3 次
- permanent：立刻终止，告知用户
- partial：用已有数据继续，标记缺失

### 2. 循环跑偏（最常出 bug）
- **症状**：agent 调了 5 轮还不收尾
- **应对**：
  - **max turn**：强制上限（业界 5-10 轮）
  - **角色回归**：每轮强制 system prompt 重读，提醒目标
  - **stuck detection**：发现连续调同一工具 → 强制 switch

### 3. LLM "幻觉"
- **症状**：编造不存在的 API / 参数 / 文档
- **应对**：
  - 工具返回必须 verify（"工具说有这个 key，但我查不到"）
  - prompt 里加 "不知道就说不知道"
  - eval 体系必须捕到

### 4. 上下文窗口爆炸
- **症状**：长会话后 context > 100k tokens，成本失控
- **应对**：
  - **compaction**：定期总结 / 提取关键信息
  - **sliding window**：只保留最近 N 轮
  - **summary buffer**：维护一个"长期 memory summary"

### 5. 工具描述不准
- **症状**：模型没用对工具（参数错、用错工具）
- **应对**：
  - 描述里加 example
  - 工具描述要持续 A/B 优化
  - 把失败 case 拿回去改进 description

## 关键 trade-off（面试必聊）

### 1. 一次性 ReAct vs 多轮 Plan-Act
- 一次性：响应快，token 少，但不准
- 多轮：准，但慢 + 贵
- **判断**：用户问题复杂度 → 选 loop 策略

### 2. 工具数量
- 工具太少：能力受限
- 工具太多：描述占 token、模型选错工具
- **业界经验**：5-15 个最佳；> 20 个要分组

### 3. Long Context（128k+）的取舍
- **优势**：能塞更多历史
- **代价**：
  - 成本暴涨（GPT-4 128k 是 8k 的 16x 价格）
  - latency 上升
  - **"Lost in the Middle"**：128k 中段的信息反而被忽略
- **实战**：用 16k-32k，配合 compaction，效果最好

### 4. 自研 agent 框架 vs LangChain / LlamaIndex
- **自研**：控制力强、能深度优化（用户 ResolveAgent 就是）
- **LangChain**：快上手，但性能 / 调试常被吐槽
- **判断**：核心业务自研，工具型业务用框架

## 评估（Eval）体系

### 1. 自动评估
- **Rule-based**：精确匹配 / 包含 / 不包含
- **LLM-as-judge**：让另一个 LLM 评分（注意 bias）
- **Embeddings**：相似度打分

### 2. 人评
- **抽样**：每周抽 50 条让运营打分
- **双盲**：让 2 个人评，看一致性

### 3. 关键指标
- **Task Success Rate**：任务完成率
- **Steps to Success**：平均步数
- **Tool Accuracy**：选对工具的比率
- **Hallucination Rate**：幻觉率
- **Cost per Task**：每次任务成本
- **Latency P95**：95 分位延迟

### 4. Eval Set（黄金集）建设
- 来源 1：历史 case（用户真实反馈）
- 来源 2：人工标注
- 来源 3：红队对抗（专门找 case）
- 关键：**持续更新**，不然 eval 退化

## 关键设计原则

### 1. Safety First
- **read-only 默认**：工具默认不能写入
- **write 必 human-in-the-loop**：危险操作必须人确认
- **审计日志**：每个工具调用都打 log

### 2. 可观测性
- 每次工具调用 → 打 trace
- 每次 LLM call → 打 token / latency
- 每次失败 → 分类 + retry 行为
- **没有可观测性的 agent = 黑盒**

### 3. 成本控制
- **模型分档**：简单任务用小模型，复杂任务用大模型
- **Prompt 压缩**：去掉冗余、保留关键
- **缓存**：相同的 query / sub-task 直接复用

### 4. 错误恢复
- **graceful degradation**：工具挂了用 fallback
- **re-think**：失败时让 LLM 自己分析原因
- **escalate**：没法了就抛给人

## 常见误区（90% 候选人栽）

- ❌ "用 LangChain 一行 chain 就够了"——生产里这种 agent 上线就会挂
- ❌ "max turn 设 50 防止跑偏"——其实 5-10 轮足够，太多会循环
- ❌ "上下文越多越好"——其实 Long Context 有 Lost in the Middle
- ❌ "幻觉靠 prompt 改改就行"——其实要靠 eval + 工具 verify
- ❌ "agent 之间通信用自然语言"——其实协议化更好（JSON schema）

## 面试钩子

**及格线**：能讲清以下任一题 → Senior
- "ReAct 和 Plan-Act-Reflect 区别 + 何时用哪个"
- "工具调用失败怎么分类处理"
- "agent 跑偏怎么防"
- "eval 怎么建，baseline 是？"

**加分项**：
- 自己实现过 agent 核心循环（不是 LangChain）
- 谈过 LLM-as-judge 的 bias 问题
- 设计过 prompt AB 框架
- 谈过 agent 安全（prompt injection / tool misuse）

**追问方向**：
- "你 agent 的 token 成本怎么优化？"
- "幻觉率怎么测？怎么降？"
- "怎么从 trace 倒推失败原因？"

---

**维护者注**：本文档每半年 review 一次。Agent 框架演进极快（OpenAI / Anthropic / Google 都在更新协议）。
