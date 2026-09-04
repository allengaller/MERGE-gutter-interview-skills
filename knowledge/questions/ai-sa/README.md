# 阿里云 AI 方向 SA · 细分方向题库（Agent 工程 / AI Infra）

> 「阿里云 SA」岗位族下，除了 [全栈 SA](../fullstack-sa/README.md)（56 题五轮）外，还细分出两个专业方向。本目录是两个细分的**专业轮题库**，参考要点全部按**线上生产最佳实践**口径写（不是 demo 级）。

## 三个细分的关系

| 维度 | 全栈 SA | Agent 工程 SA（MaaS/Agent 方向） | AI Infra SA（算力/推理方向） |
|---|---|---|---|
| 核心命题 | 云 + AI 端到端方案与赢单 | 把 Agent/RAG 应用做成客户敢上生产的系统 | 把模型跑得快、稳、省（算力经济学） |
| 专业深度 | 广度优先 | Agent 架构 / 工具链 / 评测 / 护栏 | GPU 算力规划 / 推理优化 / 集群稳定性 |
| 客户对话层级 | CIO / CTO | 业务负责人 + AI 团队 | AI 平台团队 + 基础架构负责人 |
| 薪资稀缺度 | 高 | 极高 | 极高 |

## 题库导航

| 文件 | 方向 | 题量 | 结构 |
|---|---|---|---|
| [agent-engineering.md](agent-engineering.md) | Agent 工程 SA | 13 题 | 方案面 6（客户场景/选型/编排/护栏）+ 技术面 7（架构模式/评测/幻觉/MCP） |
| [ai-infra.md](ai-infra.md) | AI Infra SA | 13 题 | 方案面 6（算力规划/TCO/国产化）+ 技术面 7（推理引擎/调度/稳定性） |

## 通用轮复用（不重复出题）

Agent 工程 SA / AI Infra SA 与全栈 SA 共享同一套软性轮次，直接复用 [fullstack-sa](../fullstack-sa/README.md) 的：

- **Round 1 HR 面**（round1-hr.md）：动机/稳定性/薪资——只在「为什么这个细分方向」处替换一句定位
- **Round 4 高管面**（round4-executive.md）：战略/跨 BU/价值观
- **Round 5 压力面**（round5-stress.md）：抗压/真实性/底线——数字口径换成对应方向的项目数字
- **快问快答**（quickfire-full-process.md）：自我介绍三版本 / 谈薪 / 反问 / 红线速查，通用

**口径纪律**：专业题参考要点与 `topics/`（agent-architectures / rag-pipeline / mcp / observability）一致；项目数字与简历模板、快问快答的数字弹药卡一致。

## 使用建议

- **投哪个岗练哪套**：Agent 工程岗练 agent-engineering.md + 全栈 SA 的 Round 3 RAG 部分；AI Infra 岗练 ai-infra.md + Round 3 的 K8s/SRE 送分题（AI Infra 面试官必问 K8s 功底）
- **线上最佳实践是答题主线**：每个参考要点都强调生产级做法（评测驱动、灰度、护栏、成本闭环）——面试官区分"玩过 demo"和"上过生产"就看这些
- 角色卡已就位：Agent 工程 / AI Infra 细分分别用 skill 里的 [ai-sa-agent](../../../.claude/skills/interview-coach/roles/ai-sa-agent.md) / [ai-sa-infra](../../../.claude/skills/interview-coach/roles/ai-sa-infra.md)（R2/R3 专业轮）；HR / 高管 / 压力等通用轮仍按 `roles/fullstack-sa.md` 画像。五轮推进与交叉验证规则见 [multi-round-sa flow](../../../.claude/skills/interview-coach/flows/multi-round-sa.md)
