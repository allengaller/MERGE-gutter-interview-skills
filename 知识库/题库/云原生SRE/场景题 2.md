# 题库 · 云原生 SRE · 故障场景

> SRE 面试最常考。**每题必走 incident-response flow**。
> 题目按"经典度 + 用户相关性"排序。

## 使用方式

agent 抽题后，按 `../../../.claude/skills/interview-coach/flows/incident-response.md` 推进。

---

## 1. etcd 集群失去 quorum

**情境**：3 节点 etcd 集群，2 节点同时宕机（机房断电）。apiserver 报错 "etcdserver: request timed out"。你 5 分钟内要拿到第一手信息。

**考察点**：
- 怎么判断 quorum 状态（`etcdctl endpoint status` / `member list`）
- 知道"失去 quorum 后 etcd 是 read-only"的细节
- 知道为什么**绝对不能**让失去 quorum 的节点强制重启加入
- 恢复路径：snapshot restore → 重建集群 → 数据校验

**及格线**：能讲清楚"为什么失去 quorum 不能强制恢复" — 这是 5 Why 起点。
**追问方向**：数据丢失的 RPO 怎么算？恢复时间怎么预估？

---

## 2. K8s 节点大面积 NotReady

**情境**：1000 节点集群，5 分钟内 200 节点同时 NotReady。告警爆炸。你是 oncall。

**考察点**：
- 第一步：看是网络问题还是 kubelet 问题（`kubectl describe node` / `journalctl -u kubelet`）
- 区分"单节点"和"集群级"故障
- 网络层：calico / cilium 健康？underlay 网络？
- kubelet 层：Pleg relist time？证书？磁盘压力？
- 控制面：apiserver 健康？scheduler 能调度新 pod 吗？

**及格线**：能在 2 分钟内给出"先看哪 3 个指标" — 体现分层排查能力。
**追问方向**：200 节点同时挂的概率分布 → 锁定故障域。

---

## 3. 线上 K8s 升级后部分 pod 起不来

**情境**：升级 K8s 从 1.28 到 1.29 后，30% 的 pod 在 `CrashLoopBackOff`。日志只有 "back-off restarting failed container"。

**考察点**：
- 先看 1.29 release notes 的 breaking changes
- 重点看：API 弃用 / PodSecurityPolicy → PSA 切换 / 容器运行时变化
- 概率最大的原因：1.28→1.29 的 PSA 默认值变了
- 缓解：临时加 `podSecurityContext` / namespace label
- 长期：分批灰度

**及格线**：能背出"1.28→1.29 主要 breaking change"前 3 个。
**追问方向**：怎么做灰度升级？哪些指标证明可以切？

---

## 4. Prometheus 监控数据丢失

**情境**：Prometheus 集群做存储扩容，重启后 6 小时的 TSDB 数据消失。但服务正常运行。

**考察点**：
- TSDB 的 WAL + checkpoint 机制
- 知道"重启会 replay WAL，但有上限"
- 知道 Prometheus 的 local storage 不适合长期保留
- 长期方案：remote write → Thanos / Cortex / Mimir
- 当前缓解：从其他副本恢复 / 从 recording rule 重算

**及格线**：能讲清楚"为什么不推荐 Prometheus local storage 长期存" — 5 Why 起点。
**追问方向**：remote write 失败怎么兜底？

---

## 5. Service Mesh（Istio）引入后延迟飙升

**情境**：业务上了 Istio，P99 延迟从 50ms 涨到 200ms。CPU 没涨。内存没涨。

**考察点**：
- Istio sidecar 引入的网络路径变化：app → sidecar → sidecar → app
- 重点：mTLS 加密开销、envoy 配置复杂度
- 排查：`istioctl proxy-config` / `tcpdump` 抓 sidecar 之间
- 缓解：调整 sidecar resource / 优化 iptables → eBPF（istio 1.20+）
- 反思：**为什么上 Istio？**这是关键 — 没想清楚就别上

**及格线**：能直接说"在排查之前先问 — 我们为什么上 Istio" — 体现工程判断力。
**追问方向**：什么时候该上 mesh？什么时候不该上？

---

## 6. 节点 OOMKilled 但 pod 内存 limit 没到

**情境**：pod 内存使用率 60% 就被 OOMKilled，但 limit 设置 1Gi，实际 RSS 才 600Mi。

**考察点**：
- 区分 container memory vs node memory
- 节点层 OOM：node-level pressure，不是 cgroup
- 看 `/proc/meminfo` 的 `MemAvailable`、kernel log 的 OOM kill 记录
- 节点上其他进程抢占（系统进程 / daemonset / 其他 pod）
- 长期：节点资源画像 + 调度策略

**及格线**：能区分 cgroup OOM 和 node OOM — 这是 90% 候选人栽的地方。
**追问方向**：怎么自动化识别"节点 OOM 但 cgroup 没到"？

---

## 7. 数据库主从切换导致应用报错

**情境**：MySQL 主库故障，HA 切换到从库。应用开始报"主键冲突"。

**考察点**：
- 主从切换的瞬间，可能有写请求落到**旧主**
- 旧主的 write 还没同步到新主（半同步延迟）
- 应用层重试机制是否健全
- 缓解：先停写 → 切换 → 重放增量
- 长期：半同步 + GTID + 应用层幂等

**及格线**：能讲清楚"主从切换的瞬间发生了什么" — 状态机分析能力。
**追问方向**：半同步延迟怎么监控？

---

## 8. CI/CD 流水线全公司挂了

**情境**：ArgoCD 集群认证过期，所有 application 同步失败，业务部署停摆。

**考察点**：
- 证书过期：K8s secret / argocd-cm / argocd-tls
- 应急：临时换 self-signed / 跳过期校验
- 长期：证书生命周期管理（cert-manager / 监控）
- 反思：这种事**怎么提前发现**？监控告警？
- 流程：变更前 checklist 是不是缺了证书一项？

**及格线**：能讲出"事故前怎么预防" — 防御性深度。
**追问方向**：你们的证书生命周期是怎么管的？

---

## 9. (占位) 用户自创 — Kudig 在生产上的实际案例

> 让用户**自己讲** Kudig 救过的真实案例。题目"留白" — 由用户填。

---

## 10. (占位) 用户自创 — EtcdGuardian 救过的真故障

> 同上。

---

## 备注

- 题目不要求用户"答对"，要求**思路清晰 + 真实细节**
- 用户答得太虚 → "具体命令 / 指标 / 时间？"
- 用户答得太细 → "先停，给我整体时间线"
- 行为面试的复盘题（5 Why、防御性深度）比技术细节**更看**
