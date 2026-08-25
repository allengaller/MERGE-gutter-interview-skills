# 项目经验 · 云原生 SRE 视角

> 按 STAR 结构整理 3 个 SRE 含金量最高的项目 + 留白位（用户自创）。**agent 提问时优先从这里挑**。
>
> **当前状态**：3 个已沉淀（Kudig / EtcdGuardian / ResolveAgent from SRE 视角）+ 2 个留白位（用户自创，面试时让用户自己讲）。

---

## 1. Kudig — K8s 节点诊断工具

**仓库**：`kudig-io/kudig`（70+ analyzers，含 eBPF）

### Situation
K8s 集群出问题时，运维同学要 30+ 分钟才能定位到根因。已有的诊断工具（kubectl-debug / node-local-dns 等）都是**单点**工具，没有统一入口；社区里没有"开箱即用"的全栈节点诊断方案。

### Task
做一个工具，能 5 分钟内**自动跑完**节点异常的全套检查（CPU / 内存 / 磁盘 / 网络 / 内核 / 容器运行时），输出**结构化诊断报告**，给运维同学"下一步动作"。

### Action
- 设计 analyzer 抽象：每个 analyzer 独立，输入是节点数据，输出是"问题 + 证据 + 建议"
- 写了 70+ 个 analyzer，覆盖 K8s 节点生命周期的所有环节
- 引入 eBPF 做网络/IO 维度诊断（不依赖 sidecar）
- 输出格式：CLI / JSON / Markdown 三种，方便人读和 CI 集成

### Result
- 在自己运维的集群里**把平均定位时间从 30 分钟降到 5 分钟**
- 工具被多个 SRE 团队采用，反馈"周末 oncall 终于不慌了"
- 沉淀出"诊断 analyzer 怎么避免 false positive"的工程经验（写在 analyzer 框架的 README 里）

### 面试钩子
- "analyzer 怎么保证 false positive 率低" — 答出"基于基线 + 阈值带 + 关联证据"才算及格
- "eBPF 在节点诊断里解决了什么根本问题" — 答出"零侵入、跨命名空间"才算及格
- "Kudig 和已有的 node-problem-detector 区别在哪" — 逼他讲清楚"开箱即用"的设计取舍

---

## 2. EtcdGuardian — etcd 备份/恢复 Operator

**仓库**：`kudig-io/etcd-guardian`

### Situation
生产 etcd 集群是 K8s 的"单点真理"，一旦数据丢或损坏，整个集群崩。但社区的 etcd-operator 备份功能**很弱**：不支持连续备份、恢复时不知道选哪个 snapshot、跨集群 restore 复杂。

### Task
做一个 Operator，提供：连续备份（每 5 分钟）、自动保留策略、跨集群 restore 演练、可观测性。

### Action
- 用 Operator 模式跑在 K8s 集群内
- snapshot 用 S3 存，按保留策略自动清理
- 设计"restore 演练"机制：定期在隔离环境恢复 snapshot 验证可用性
- 把 snapshot 元数据存到 CRD 里，方便检索

### Result
- RPO 从天级降到 5 分钟级
- 多次在生产故障中成功 restore，平均恢复时间 < 30 分钟
- 团队养成了"定期 restore 演练"的文化

### 面试钩子
- "etcd 备份时怎么保证一致性" — 答出"lease + snapshot + fsync"才算及格
- "restore 时遇到 quorum 丢失怎么办" — 答出"禁用 write-only member 强制恢复"或类似细节才算及格
- "Operator 模式和直接跑 cron 区别" — 逼他讲清楚 K8s-native 的好处

---

## 3. ResolveAgent — AIOps / RAG / Agent

**仓库**：`ai-guru-global/resolve-agent`

### Situation
SRE 团队日常被"告警 → 看日志 → 查文档 → 问人"这条链路消耗大量时间。**问题不是缺工具，而是工具之间没有串联**。

### Task
做一个 AI agent，能**自动**接 alert → 拉相关日志/指标 → 查内部 runbook → 给出根因假设 + 修复建议。

### Action
- 用 RAG 检索内部 runbook（向量库 + 重排）
- 用 Agent 框架接 Prometheus / Grafana / Loki / 内网工单系统
- 设计"工具调用安全边界"：read-only 默认，write 操作必须人工 confirm
- 设计 eval 体系：跑历史故障 case 集，量化"根因命中率"

### Result
- 团队 P0 告警平均响应时间缩短 40%
- 多次真实故障中，agent 给出的假设被 oncall 同学采用为修复方向
- 沉淀了"agent 评估在 AIOps 场景怎么做"的方法论

### 面试钩子
- "AIOps agent 的 false positive 怎么控" — 答出"必须 human-in-the-loop"才算及格
- "agent 给出的建议如果错，怎么溯源" — 答出"工具调用日志 + 证据链"才算及格
- "RAG 的 chunking 在 runbook 场景怎么选" — 答出"按 section 切而不是按 token 数"才算及格

---

## 4. (留白) etcd 集群 quorum 丢失事故复盘

> **这是留白位** —— 面试时让用户**自己讲**他印象最深的故障，agent 不用预设答案。
> 留白原因：真实生产事故涉及团队 / 时间 / 客户影响，不适合让 agent 预设答案。整理好模板，让用户讲故事。
>
> **面试钩子**（按 incident-response flow）：
> - 时间线还原：告警 → 第一次响应 → 根因发现 → 止血 → 长期修复
> - 5 Why 反思（挖到系统层面）
> - 防御性深度：SOP / Runbook / 监控 / 架构 / 团队哪几个改了？
> - 复盘闭环：怎么验证真的有效？怎么推广到别的系统？

---

## 5. (留白) 渐进式发布体系 / 其他 SRE 重点项目

> **留白位** —— 用户的简历里提过 CI/CD 与渐进式发布。这个项目用户可以自己补充 STAR 或讲一段完整介绍。
> 留白原因同上：避免 agent 用伪答案替代用户真实项目。
>
> 建议补全字段（用户自己填）：
> - **Situation**：什么场景推动做这个？痛点是什么？
> - **Task**：范围 / 量化目标（RPO / RTO / 自动化比例）
> - **Action**：关键设计选择 / 为什么这么选
> - **Result**：量化指标 + 业务影响 + 团队影响

---

## 备注

- 这份文档**半年 review 一次**：过时的项目降级或删除，新项目加进来
- 用户是**双栖**（SRE + AI），所以 `../ai-engineer/projects.md` 里也有项目
- 面试时优先用**他自己做的工具项目**切入 — 比假设题更真实
- 留白位（4 和 5）不要让 agent 自己补答案，必须等用户自己讲
