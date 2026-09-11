# 题库 · 云原生 SRE · Senior（5y+）

> 系统设计为主。**适合 Staff+ / 架构师面试**。
> 题目按"经典度 + 用户相关性"排序。

---

## 1. 设计一个 K8s 集群的监控告警体系

**情境**：从 0 到 1 设计一个 1000 节点 K8s 集群的监控告警体系。覆盖指标/日志/链路/告警/SLO。

**考察点**：
- 选型：Prometheus + Thanos / Mimir / VictoriaMetrics
- 日志：Loki / ES
- 链路：Tempo / Jaeger
- 告警：Alertmanager + 分级（info / warn / critical）
- SLO：错误预算体系
- 成本：remote write 降采样、recording rule

**及格线**：能讲清楚"为什么不上自研监控系统" — 体现工程取舍。
**追问方向**：告警风暴怎么降噪？值班同学 7x24 怎么不疲劳？

---

## 2. 设计 etcd 集群的多机房高可用

**情境**：金融场景，3 机房部署 etcd，RPO < 1 分钟，RTO < 5 分钟。

**考察点**：
- etcd 的 Raft 不能跨机房（latency）
- 方案 A：同城双活 + 异地异步备份
- 方案 B：3 机房 5 节点（部分机房多数派）
- 权衡：一致性 vs 可用性
- 备份策略：每分钟 snapshot + WAL 增量
- 演练：定期 restore 演练

**及格线**：能讲清楚"etcd 为什么不能跨机房" — Raft heartbeat 延迟敏感性。
**追问方向**：备份加密怎么做？restore 时怎么验证数据完整性？

---

## 3. 设计一个渐进式发布系统

**情境**：支撑 100 个微服务的渐进式发布，灰度 / 蓝绿 / 金丝雀，自动化回滚。

**考察点**：
- 选型：Argo Rollouts / Flagger / 自研
- 灰度策略：按流量比例 / 按用户标签 / 按地域
- 自动化回滚：基于 metrics / error rate / latency SLO
- 可观测性：发布过程的指标看板
- 安全：变更窗口 / 审批流

**及格线**：能讲出"自动回滚的指标阈值怎么定" — 量化设计。
**追问方向**：金丝雀 1% 流量到全量，决策点怎么定？

---

## 4. 从 0 到 1 设计 K8s 集群的故障自愈系统

**情境**：节点 / pod 故障能自动恢复，无需人工介入。

**考察点**：
- 节点自愈：cluster-autoscaler / node-problem-detector
- Pod 自愈：LivenessProbe / ReadinessProbe / StartupProbe
- PDB（PodDisruptionBudget）防止雪崩
- 健康检查的"误判"问题：probe 太敏感会重启风暴
- 自研 vs 开源：什么时候自研（参考用户 Kudig）

**及格线**：能讲出"健康检查的边界在哪" — 误判问题。
**追问方向**：自愈系统的可观测性怎么设计？

---

## 5. 设计一个公司级的 Chaos Engineering 平台

**情境**：500+ 微服务，每周做一次全公司级故障演练。

**考察点**：
- 选型：Chaos Mesh / Litmus / ChaosBlade
- 演练范围：单服务 → 跨服务 → 跨机房
- 演练设计：blast radius / abort condition
- 演练流程：演练前 review → 演练中监控 → 演练后复盘
- 风险：演练误伤怎么兜底

**及格线**：能讲出"演练的 abort condition 怎么定" — 风险控制。
**追问方向**：演练的频率 / 范围怎么渐进？

---

## 6. (占位) 用户自创 — Kudig 整体架构设计

> 让用户**自己讲** Kudig 的设计：70+ analyzer 怎么组织、eBPF 怎么集成、false positive 怎么控。

---

## 7. (占位) 用户自创 — EtcdGuardian 整体架构设计

> 同上。

---

## 8. (占位) 用户自创 — ResolveAgent 整体架构设计

> AIOps agent 的 RAG + 工具调用 + eval 体系。

---

## 备注

- Senior 面试必问"取舍"，不要唯一解
- 必问"如果再给一周，改哪里" — 反思能力
- 用户答得好 → 升级到 follow-up 题（架构细节 / 量化）
- 用户答得虚 → "具体到代码 / 命令 / 数字"
