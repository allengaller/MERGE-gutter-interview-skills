# Topic · K8s 内部机制

> 给 interview-coach skill 加载。**按需引用**——agent 答 K8s 题时回这里查。
> 主路径 + 关键 trade-off，不抄文档。

---

## 主路径：从 kubectl apply 到 Pod Ready

```
kubectl apply -f deployment.yaml
        │
        ▼
┌────────────────┐
│   kube-apiserver  │ ← 唯一入口（所有组件都连它）
└────────┬───────┘
         │ (REST + watch)
         ▼
┌────────────────┐
│  etcd (CRD+状态)  │ ← 真相唯一来源
└────────▲───────┘
         │
   Informer / ListWatch
         │
   ┌─────┼──────────────┐
   ▼     ▼              ▼
controller-manager  scheduler   kubelet
   │     │              │
   │  ┌──▼────────┐     │
   │  │ 调度循环  │     │
   │  │ Predicate │     │
   │  │ Priority │     │
   │  └────┬─────┘     │
   │       ▼           │
   │   绑定（bind）    │
   │       │           │
   │       ▼           ▼
   │   (apiserver 更新 spec.nodeName)
   │                   │
   │                   ▼
   │              ┌─────────┐
   │              │  kubelet  │
   │              │ (每个节点) │
   │              └────┬─────┘
   │                   ▼
   │            CRI → 容器运行时
   │                   ▼
   │            CNI → pod 网络
   │                   ▼
   │            CSI → 持久化存储
   │                   ▼
   │            ┌──────────────┐
   │            │ Status 回到  │
   │            │ apiserver    │
   │            └──────────────┘
```

## 核心组件（每个组件都不知道完整拓扑，只 watch 自己关心的）

### kube-apiserver
- **唯一接入层**：所有组件（含 kubectl）都通过 REST 访问
- **状态机**：写入校验 → 持久化 etcd → 返回
- **幂等性**：resourceVersion + 乐观锁（防止并发写冲突）
- **关键 trade-off**：apiserver 是单点，但 stateless——可以多副本 + LB 横向扩

### etcd
- **Raft 共识**：3/5 节点多数派写入成功才返回
- **data model**：key 是 `/registry/<resource>/<ns>/<name>`, value 是序列化后的 K8s 资源
- **watch 机制**：基于 revision（全局递增），保证不丢事件
- **生产坑**：etcd 磁盘 I/O 抖动 → 整个集群 hang（背锅太多次）

### scheduler
- **两阶段**：Predicate（谓词过滤，节点够不够）+ Priority（优先级打分）
- **调度框架扩展点**（Kubernetes 1.17+）：PreFilter / Filter / PreScore / Score / Reserve / Permit
- **默认行为**：binpack（尽可能把 pod 打散到负载低的节点）
- **关键 trade-off**：调度决策存 pod.spec.nodeName，写 etcd → apiserver 是瓶颈

### controller-manager
- **Reconcile 循环**："观察 spec → 与 status 对比 → 调整 status 靠近 spec"
- **level-triggered**（不是 edge-triggered）：不停 reconcile，没有事件也能发现偏差
- **每个控制器一个独立 goroutine**：DeploymentController / ReplicaSetController / NodeController ...
- **生产坑**：controller-manager 重启后刚开始会"刷一遍"，触发大量 update

### kubelet
- **最复杂的组件**：每个节点一份
- **核心循环**：syncLoop → 拉 pod spec → CRI 起容器 → 报状态
- **PLEG (Pod Lifecycle Event Generator)**：从 cri 抓容器事件，写本地缓存
- **Probe**：Liveness / Readiness / StartupProbe（语义完全不同！）
- **生产坑**：kubelet 自己挂 → 节点 NotReady，但 pod 可能还在运行（"幻象 Pod"）

## 调度 16 谓词（关键面试点）

**必备 6 个**：
1. **PodFitsHost**：pod.spec.nodeName 指定节点
2. **PodFitsHostPorts**：port 冲突
3. **PodMatchNodeSelector**：nodeSelector
4. **PodMatchNodeAffinity**：NodeAffinity（required / preferred）
5. **PodFitsResources**：CPU / 内存 / 巨页（最常被打满）
6. **NoVolumeZoneConflict**：PV zone 约束

**重要加分项**：
7. **MatchToleration**：Taints / Tolerations
8. **PodTopologySpread**：拓扑分布约束（zone / node）
9. **MatchInterPodAffinity**：Pod 间亲和性（密集 / 反密集）

> **面试问题**："16 个能背几个？"——能背 8 个算及格，能区分 required vs preferred 算加分。

## 关键 trade-off（面试必聊）

### 1. apiserver 单点 vs 横向扩
- apiserver 是无状态的，理论上可横向扩
- 但所有请求都要走它，是事实上的单点
- 实际：用 haproxy / nginx LB + 多 apiserver；etcd 集群独立扩

### 2. etcd 数据一致性 vs 可用性
- Raft 强一致，但多数派写入延迟敏感
- 同城 RTT < 5ms 能跑 Raft，跨机房 lat > 50ms 不能
- **判断线**：单一 region 内可用 Raft，跨 region 用备份

### 3. 调度器集中 vs 分布
- 集中调度（K8s 现状）：scheduler 是单点（可多副本但 leader only）
- 优势：全局视野，最优解；劣势：scheduler 挂 → 所有 pod 起不来
- **kube-scheduler 自己 HA**：leader-election + apiserver 锁

### 4. controller-manager 同上

## 常见误区（90% 候选人栽）

- ❌ "scheduler 不会重启 pod"——它确实不重启，它只调度；pod 起不来是 kubelet 的事
- ❌ "PreferEqualScheduling 删除所有策略"——其实 K8s 删了部分策略，但 Taints/NodeAffinity 还在
- ❌ "kubelet 跟 apiserver 是长连接"——是 HTTP watch，不是长连接（容易被网络抖动断）
- ❌ "K8s 自带服务发现"——其实是 CoreDNS；K8s 只管 Service 抽象，DNS 由 DNS provider 负责
- ❌ "scheduler 默认 binpack"——**默认 LeastAllocated**（优先调度到空闲率高的节点），不是 binpack

## 面试钩子（怎么用这文件）

**及格线**：能讲清以下任一题 → 答对的算 Senior
- "deployment 改了镜像，pod 重建流程，按顺序讲每一步谁做了什么"
- "scheduler 把 pod 调度到一个节点，但 kubelet 怎么知道？"
- "controller 怎么避免重复 reconcile？"
- "watch 断线后会漏事件吗？怎么补偿？"

**追问方向**：
- "scheduler 调度完，pod 起不来——你怎么定位是哪一层的问题？"
- "apiserver 挂了，控制面会怎样？数据面会怎样？"
- "etcd 数据丢失，整个集群状态怎么算？"

---

**维护者注**：本文档按"主路径 + 关键 trade-off"组织。如果发现过时（K8s 大版本变化），半年 review 一次。
