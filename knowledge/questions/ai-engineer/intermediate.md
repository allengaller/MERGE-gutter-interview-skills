# 题库 · AI 智能体工程师 · Intermediate（2-5y）

> 编码 + RAG / Agent 基础题。**适合 P5-P6 中级岗**。
> 题目按"经典度 + 用户相关性"排序。

---

## 编码题

### 1. 实现一个简单的 RAG 检索

要求：
- 给一段文档，按 paragraph 切 chunk
- 计算 embedding（用 mock 或真 API）
- 给 query，返回 top-3 相关 chunk
- 输出：chunk 文本 + 相似度分数

**考察点**：
- chunking 边界
- embedding 调用
- 相似度计算（cosine）
- 结果排序

**追问**：怎么评估检索质量？ground truth 怎么建？

---

### 2. 实现 Agent 的工具调用循环

要求：
- 给定工具列表（mock 2-3 个）
- 实现 plan/act/reflect 循环
- 工具失败时怎么处理
- 限制最多 5 轮避免死循环

**考察点**：
- 状态机
- 错误处理
- 终止条件
- 日志输出

**追问**：怎么判断 agent "卡住了"？怎么强制结束？

---

### 3. 实现 prompt 版本管理

要求：
- prompt 存文件系统
- 支持版本号（v1, v2, v3...）
- 支持 AB 测试（按用户 ID hash 路由）
- 调用时记录用了哪个版本

**考察点**：
- 路由逻辑
- 可观测性
- 回滚能力

**追问**：AB 跑多久出结论？样本量怎么算？

---

## 概念题（口述）

### 4. 解释 RAG 的全链路

**及格线**：能讲清楚：
- chunking → embedding → 存向量库 → 检索 → rerank → 给 LLM
- 每个环节的常见坑
- 怎么评估

---

### 5. 解释 Agent 的核心循环

**及格线**：能讲清楚：
- ReAct（Reason + Act）
- plan/act/reflect
- 工具调用协议
- 错误恢复

---

### 6. 解释 Function Calling 协议

**及格线**：能讲清楚：
- tool definition 格式
- tool call 返回格式
- 多工具并行调用
- 错误传播

---

### 7. 解释 LLM 的 token / context window / cost

**及格线**：能讲清楚：
- 1 token ≈ 0.75 个英文单词 / 1-2 个中文字
- context window 包含 input + output
- 成本：input 便宜、output 贵
- 长上下文不是越大越好（latency + cost + 注意力稀释）

---

### 8. 解释 Embedding 模型

**及格线**：能讲清楚：
- 语义相似度
- 维度 vs 速度 vs 成本
- 主流模型（OpenAI / bge / m3e）

---

## 系统设计（小型）

### 9. 设计一个文档问答系统

要求：
- 上传 PDF → 切分 → 检索 → 回答
- 引用来源
- 处理"答不出来"的情况

**考察点**：
- chunking 策略
- "答不出来"是重要的产品能力
- 引用 = 信任

**追问**：幻觉怎么控？怎么知道是模型编的还是文档里有的？

---

### 10. 设计一个工具调用的安全边界

要求：
- 工具分级（safe / sensitive / dangerous）
- dangerous 工具必须 human-in-the-loop
- 审计日志

**考察点**：
- 权限模型
- 风险控制
- 可观测性

**追问**：怎么防止 prompt injection 绕过安全边界？

---

## 备注

- 中级岗重点看"基础功"
- 必考一题"口述概念"，看知识深度
- 编码题用户答得快 → 升级到 senior 题
