# 项目经验 · AI 智能体工程师视角

> 按 STAR 结构整理的 5 个 AI 含金量最高的项目。**agent 提问时优先从这里挑**。

---

## 1. ResolveAgent — AIOps / RAG / Agent

**仓库**：`ai-guru-global/resolve-agent`

### Situation
SRE 团队日常被"告警 → 看日志 → 查文档 → 问人"这条链路消耗大量时间。每个新人 oncall 都要花 2-3 周才能上手。

### Task
做一个 AI agent，能**自动**接 alert → 拉相关日志/指标 → 查内部 runbook → 给出根因假设 + 修复建议。**关键是让新人都能用**。

### Action
- 用 RAG 检索内部 runbook（向量库 + BM25 重排 + LLM rerank）
- 用 Agent 框架接 Prometheus / Grafana / Loki / 内网工单系统
- 设计"工具调用安全边界"：read-only 默认，write 操作必须 human-in-the-loop confirm
- 设计 eval 体系：跑历史故障 case 集，量化"根因命中率"
- 设计 prompt 版本管理 + AB 框架

### Result
- 团队 P0 告警平均响应时间缩短 40%
- 多次真实故障中，agent 给出的假设被 oncall 同学采用为修复方向
- 沉淀了"agent 评估在 AIOps 场景怎么做"的方法论（写在 README 里）
- 新人上手时间从 2-3 周降到 1 周

### 面试钩子
- "AIOps agent 的 false positive 怎么控" — 答出"human-in-the-loop 是底线"才算及格
- "agent 给出的建议如果错，怎么溯源" — 答出"工具调用日志 + 证据链"才算及格
- "RAG 在 runbook 场景的 chunking 怎么选" — 答出"按 section 切而不是按 token 数"才算及格
- "eval 怎么建，baseline 是？" — 答出"用历史故障做 ground truth"才算及格

---

## 2. mcp4coder — MCP 工具聚合

**仓库**：`standup-coder/mcp4coder`

### Situation
MCP（Model Context Protocol）出来之后，工具调用标准统一了。但实际用的时候，每个 agent 框架的 MCP 集成都不一样，**工具调用成了"碎片化"**。开发者要在 LangChain / Cursor / Claude Code / 自研框架之间重复配工具。

### Task
做一个**统一**的 MCP 工具聚合层：开发者配一次，**所有 agent 框架**都能用。理解 MCP 协议 + 多框架适配。

### Action
- 抽象 MCP server registry：声明一次，暴露到多个 agent 框架
- 工具描述优化：减少 token 消耗
- 安全策略：每个工具的权限边界（read/write/delete）
- 跨平台：支持 Claude Code / Cursor / LangChain / 自研

### Result
- 在自己日常使用的 5+ agent 框架里**配置一次到处用**
- 工具 token 消耗减少 30%（通过描述压缩）
- 开源后被一些团队采用

### 面试钩子
- "MCP 协议里最容易被忽略的字段是哪个" — 答出"安全 / 错误传播"才算及格
- "工具描述太长怎么压缩" — 答出"语义等价 + 主动 query 展开"才算及格
- "工具调用失败怎么处理" — 答出"分 transient / permanent"才算及格

---

## 3. LeetCast — AI 对话 podcast

**仓库**：`standup-coder/leetcast`

### Situation
AI 圈信息过载，长文太多，短摘要又丢上下文。想做"中等长度、能听、有深度的 AI 圈周报"。

### Task
做一个产品：抓取 AI 圈每周重要 paper / 博客 / 推文 → 提炼为对话式 podcast → 自动生成音频。

### Action
- 语料 pipeline：RSS / arxiv / HN / 推文 → 清洗 → 摘要
- 主持 AI 化：两个 agent 互相对话（"主持人"+"嘉宾"角色）
- TTS 集成：选音色、调情感、卡节奏
- 人工 + 自动评估：每周人工校 1 集，其余自动跑

### Result
- 周更稳定运行 6+ 月
- 沉淀了"AI 内容产品的语料 pipeline 怎么搭"的工程经验
- 验证了"AI agent 互相对话"在长内容场景的可行性

### 面试钩子
- "AI 内容产品的版权怎么搞" — 答出"摘要 + 引用 + 平台协议"才算及格
- "agent 互相对话怎么避免循环 / 跑偏" — 答出"角色边界 + turn budget"才算及格
- "用户反馈怎么采集，迭代怎么量化" — 答出"留存 + NPS + 完播率"才算及格

---

## 4. OpenDemo — 语料工程能力证明

**仓库**：`opendemo-work/opendemo`（518+ tech demos）

### Situation
做了大量 AI/技术 demo，散落在不同 repo。需要**结构化沉淀**，方便以后做 RAG 语料、给别人参考、自己复习。

### Task
造一个体系：每个 demo 一篇 markdown，标准化字段，自动化 dedup / 索引。

### Action
- 模板化：每篇 demo 必填"问题 / 解法 / 代码 / 复盘"四段
- 自动化：脚本扫仓库 → 生成索引 → 去重 → 分类
- 双索引：按主题 + 按时间，方便不同场景检索
- 部分语料接入到 ResolveAgent 的 RAG 检索

### Result
- 518+ demo 沉淀
- 部分语料被实际 RAG 系统使用（验证了"自己的语料自己训"路径）
- 沉淀了"个人语料工程怎么可持续"的工程经验

### 面试钩子
- "语料去重怎么做的" — 答出"语义去重 + 引用网络"才算及格
- "语料版权怎么搞" — 答出"原创为主 + 引用标注 + 协议"才算及格
- "怎么防止 demo 沉淀变成垃圾场" — 答出"质量门槛 + 定期 review"才算及格

---

## 5. (示例：待补) 用户的"AI x SRE"交叉经验

> **占位** — 用户 SRE + AI 双栖，**应该有 1-2 个**典型的"用 AI 解决 SRE 痛点"的项目。等他补充。

---

## 备注

- 这份文档**半年 review 一次**
- 用户的 AI 项目**绝大多数有 SRE 背景**（AIOps、agent 工具调用、运维自动化），面试时善用这个双栖
- 优先用**他自己做的工具项目**切入 — 比假设题更真实
