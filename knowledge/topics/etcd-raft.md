# Topic · etcd & Raft

> 给 interview-coach skill 加载。**SRE 面试最常考的"看家"题**。
> 主路径 + 关键 trade-off。

---

## 主路径：写一个 key 到读出来

```
client: PUT /v3/kv/put { key:"/registry/foo", value:"bar" }
        │
        ▼
┌──────────────────────────┐
│  etcdserver (本节点)        │
└──────────┬───────────────┘
           │ (raft node.Propose)
           ▼
┌──────────────────────────┐
│  raft 层（共识）          │
└──────────┬───────────────┘
           │
   log entry: { term, index, data }
           │
   并行广播给所有 peers（含自己）
           │
   多数派 ack → 提交到状态机
           │
           ▼
┌──────────────────────────┐
│  MVCC (treeIndex + boltDB) │
└──────────────────────────┘
```

## Raft 三大概念（必背）

### 1. Term（任期）
- **全局递增时间戳**：每次选举 +1
- **关键规则**：
  - 每个 term 最多 1 个 leader
  - 节点见到更大的 term → 立即变 follower
  - split vote 时 → term +1，重选
- **面试问题**："两个 follower 同时变成 candidate，都拿到 2 票，会发生什么？"——都没过半，term +1，等下个 election timeout 重选

### 2. Leader Election
- **触发**：election timeout（150-300ms 随机）内没收到 leader heartbeat
- **流程**：
  1. follower → candidate，term +1
  2. 投自己一票，广播 RequestVote RPC
  3. 收到多数派 vote → 当选 leader
  4. 立即发 AppendEntries（空日志）建立权威
- **关键约束**：
  - **至少一条候选日志**：candidate 的最后日志 ≥ voter 的最后日志才能拿票
  - 这保证了 leader 一定有完整日志

### 3. Log Replication
- **AppendEntries RPC**：leader → all followers
- **一致性检查**：leader 记录每个 follower 的 `matchIndex`，落后就补发
- **提交条件**：多数派写盘后才标"committed"
- **关键**：committed ≠ applied（应用是异步的）

## 生产实战重点

### 1. 为什么 etcd 不能跨机房
- **Raft heartbeat 延迟敏感性**：election timeout 是 150-300ms
- 跨机房 RTT 通常 > 50ms，单条 RPC 往返 100ms+
- 网络抖动时频繁 split vote → **脑裂 + 不可用**
- **替代方案**：同城 Raft + 异地异步复制（不是 Raft）

### 2. 为什么备份时不用 Raft"半数派写入"
- Raft 是**写**多数派，但 watch / read 有"linearizable vs Serializable"两种读
- **linearizable read**：要走一次 Raft 确认 leadership（避免 stale leader 读脏）
- **Serializable read**：读本地（性能高，但要 client 处理 stale）
- etcd v3 默认 linearizable，强一致

### 3. Snapshot 机制
- 触发：日志过多（默认 10000 entries 或 8MB）
- 流程：leader 拍 snapshot → 发 InstallSnapshot RPC 给落后 follower
- **坑**：snapshot 期间 apply 阻塞，对延迟有影响

### 4. 为什么失去 quorum 不能强制恢复
- 3 节点集群，1 个宕机，剩 2 个能继续写（多数派）
- 3 个宕机 2 个，剩 1 个，**绝对不能让这个节点"自封 leader"**
- 因为这个节点可能已经落后很多日志，强制写入 = 数据丢失
- **正确恢复路径**：
  1. 隔离故障节点（防脑裂）
  2. 从 snapshot + WAL 重建集群（4 步：拿 backup → 新集群 init → bootstrap → 数据校验）
  3. 应用层必须校验恢复后的数据完整性（RPO 评估）

### 5. WAL + Snapshot 协同
- **WAL (Write Ahead Log)**：每次写先 append 到磁盘日志，再 apply
- **Snapshot**：定期压缩，释放磁盘
- **故障恢复**：先 replay WAL（apply committed 没 apply 的 entries）→ 加载 snapshot 之后的状态
- **关键**：WAL 是顺序写，不涉及随机 I/O，所以很快

## 关键 trade-off（面试必聊）

### 1. 强一致 vs 高可用
- Raft 必须多数派，所以 (n/2 + 1) 节点挂集群就废了
- 5 节点集群：能容忍 2 节点挂；3 节点集群：能容忍 1 节点挂
- **7 节点**：选主更快但写延迟更高；**3 节点**：多数派距离短但容错低
- K8s 生产经验选 **5 节点**（平衡点）

### 2. 读延迟 vs 一致性
- linearizable read：每次走 quorum，延迟 = 心跳一轮
- Serializable read：读本地，延迟 = 0，但可能 stale
- K8s apiserver 默认走 watch + cache，本质上接受 stale

### 3. 备份频率 vs 性能
- 每秒 backup → RPO 1 秒但磁盘压力极大
- 每 5 分钟 backup → RPO 5 分钟，业界常见
- **更进一步**：连续备份（snapshot + incremental WAL），EtcdGuardian 就是这个思路

## 常见误区（90% 候选人栽）

- ❌ "Raft 是 P2P"——其实有 leader，平时只有 leader 接受 client 请求
- ❌ "选举之后立即同步所有数据"——选举只是选 leader，数据同步是 AppendEntries 做的
- ❌ "snapshot 越大越好"——其实太大的时候单 RPC 超时要分片
- ❌ "etcd 用 Raft 就一定强一致"——其实是线性一致（linearizable），不是顺序一致（sequential）

## 面试钩子

**及格线**：能讲清以下任一题 → Senior
- "Raft 选举超时为什么是随机？"
- "5 节点 etcd，挂 2 个为什么还能写？"
- "linearizable read 和 Serializable read 区别"
- "失去 quorum 后为什么不能强制重启加入？"

**加分项**：
- 能画 leader election 状态机
- 能讲清 pre-vote 优化（避免 partition 恢复后的频繁选举）
- 知道 etcd 的 disk wal/fsync 调优参数（wal_dir / heartbeat-interval / election-timeout）

**追问方向**：
- "你们 etcd 集群规模多大？为什么不更大？"
- "snapshot 多久做一次？怎么做对延迟影响最小？"
- "restore 时怎么验证数据完整性？"

---

**维护者注**：本文档每半年 review 一次。Raft 理论和 etcd 实现都有演进。
