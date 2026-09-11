# 题库 · AI 智能体工程师 · Senior（5y+）

> 系统设计为主。**适合资深 AI 工程师 / AI Architect 面试**。
> 题目按"经典度 + 用户相关性"排序。

---

## 系统设计

### 1. 设计一个生产级 Agent 系统（接 RAG + 工具 + Memory）

**情境**：从 0 到 1 设计一个生产级 agent，能力包括：
- 接 RAG 检索内部知识库
- 调用 5+ 工具（搜索 / 数据库 / API / 工单）
- 长期记忆（用户偏好 / 历史）
- 多轮对话 + 工具失败重试

**考察点**：
- 架构：plan/act/reflect 循环
- 上下文管理：128k 不是越大越好
- 工具调用安全：read-only 默认，write 必 human-in-the-loop
- 错误恢复：transient vs permanent
- 可观测性：每次工具调用必须打 log
- 成本：token 优化、模型分档
- Eval：怎么量化效果

**及格线**：能讲出"agent 失败模式有哪些 + 怎么兜底" — failure mode 意识。
**追问方向**：long context 的取舍、agent 互相对话怎么做、prompt 注入怎么防。

---

### 2. 设计 RAG 全链路（生产级）

**情境**：1 亿文档 / 1 万 QPS / P99 延迟 < 500ms / 检索准确率 > 90%。

**考察点**：
- Chunking 策略：按语义 / 按 section / 按 token
- Embedding 选型：维度 / 速度 / 成本
- 检索：向量 + BM25 混合
- Rerank：cross-encoder / LLM
- 缓存：query 缓存 / embedding 缓存 / 结果缓存
- 增量更新：怎么避免全量重建
- 评估：retrieval recall / answer accuracy

**及格线**：能讲出"chunking 为什么不能按 token 数硬切" — 领域知识。
**追问方向**：embedding 模型升级怎么做（数据回填成本）？

---

### 3. 设计 MCP 工具聚合层

**情境**：用户用 Claude Code + Cursor + LangChain + 自研框架 4 个 agent 框架，每个都要配工具。工具总数 20+。

**考察点**：
- MCP 协议理解深度
- 工具描述优化：减少 token 消耗
- 权限边界：read/write/delete
- 跨平台适配
- 工具版本管理

**及格线**：能讲出"MCP 协议里最容易被忽略的字段" — 协议理解深度。
**追问方向**：工具调用失败怎么重试？工具之间的依赖怎么处理？

---

### 4. 设计 AI 应用的 Eval 体系

**情境**：迭代中的 AI 应用，怎么保证"改了一个 prompt 没把别的搞坏"？

**考察点**：
- Ground truth 构造：人工标注 / 历史 case
- 自动化评估：LLM-as-judge / 规则
- 人评：抽样 / 双盲
- 回归测试：版本对比
- 监控：线上指标
- A/B 框架

**及格线**：能讲出"LLM-as-judge 的 bias 怎么控" — 评估方法论。
**追问方向**：用户反馈怎么闭环到 eval set？

---

### 5. 设计 AI 应用的可观测性

**情境**：AI 应用在线上出问题，怎么定位是 prompt 错了 / 检索错了 / 工具调用错了 / LLM 抽风了？

**考察点**：
- 全链路 trace：输入 → prompt → 工具调用 → 输出
- 成本追踪：每个请求的 token 消耗
- 延迟追踪：每一步的耗时
- 失败模式分类：transient / permanent / partial
- 用户反馈接入

**及格线**：能讲出"AI 系统的失败模式分类" — 体现工程深度。
**追问方向**：怎么从 trace 倒推出"为什么这次失败"？

---

## 深入追问题

### 6. 你的 agent 框架里，工具调用失败怎么重试？

**及格线**：能区分：
- transient（重试可解）
- permanent（重试无解）
- partial（部分成功）

---

### 7. 你的 RAG 系统，embedding 模型升级了，旧数据怎么处理？

**及格线**：能讲出"全量回填成本 + 增量回填策略"。

---

### 8. 你的 AI 应用，prompt 注入攻击怎么防？

**及格线**：能讲出多层防御：
- 输入清洗
- 工具权限边界
- 敏感操作 human-in-the-loop
- 审计日志

---

### 9. 你的 agent 给了错误建议，用户据此操作造成损失，谁负责？

**及格线**：能讲出"AI 系统的责任边界 + human-in-the-loop 必要性"。

---

### 10. (占位) 用户自创 — ResolveAgent 整体架构设计

> 让用户**自己讲** ResolveAgent 的设计：RAG + 工具 + eval 体系。

---

## 备注

- AI 工程师面试特别看重**失败模式意识**和**量化能力**
- 必问"效果怎么衡量，baseline 是？"
- 必问"如果用户输入恶意 prompt / 工具返回错误数据 / LLM 抽风，你怎么办？"
- 工程师 vs API 调包侠是分水岭
