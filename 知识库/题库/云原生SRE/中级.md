# 题库 · 云原生 SRE · Intermediate（2-5y）

> 编码 + 基础设计题。**适合 P5-P6 中级岗**。
> 题目按"经典度 + 用户相关性"排序。

---

## 编码题

### 1. 实现 LRU 缓存

**经典**。但**重点不在 AC**，重点在：
- 边界：capacity = 0？并发？
- 命名：Get / Put / Remove
- 选型：双向链表 + hashmap，O(1)
- 测试：并发场景下是否安全

**追问**：线程安全怎么加锁？分段锁？sync.Map？

---

### 2. K8s pod 状态机转换

给一段 pod 的状态变化日志（用 kubectl get events 模拟），写代码判断：
- 当前状态
- 异常状态（如 ImagePullBackOff → CrashLoopBackOff）
- 转换时间线

**考察点**：
- 状态机设计
- 时间线还原
- 异常识别

**追问**：如果状态变化有缺失（log 漏了）怎么办？

---

### 3. etcd watch 事件流处理

设计一个程序：监听 etcd 的 key prefix 变化，把事件流写入本地日志。要求：
- 断线重连
- at-least-once 语义
- 不丢事件

**考察点**：
- etcd watch 协议（revision / progress notification）
- 重连策略（指数退避）
- 幂等（event ID）

**追问**：revision 跳变怎么处理？怎么判断"是否漏了"？

---

## 系统设计（小型）

### 4. 设计 K8s node 问题检测脚本

要求：
- 检测 CPU / 内存 / 磁盘 / 网络 / kubelet 健康
- 输出结构化报告（JSON / Markdown）
- 阈值可配置

**考察点**：
- 分层设计：先看哪层
- 阈值：静态 vs 动态（基于基线）
- 扩展性：新增检查项的代价

**追问**：false positive 怎么控？

---

### 5. 设计 K8s 应用回滚系统

要求：
- 一键回滚到指定版本
- 保留历史版本
- 回滚过程可观测

**考察点**：
- 存储 deployment 历史（Revision）
- 触发：kubectl rollout undo / 自研
- 验证：回滚后健康检查

**追问**：怎么判断"回滚成功"？回滚失败怎么办？

---

## 知识题（口述）

### 6. 解释 K8s 调度的 16 个谓词

**及格线**：能背出 8 个以上（NodeAffinity / PodAffinity / NodeSelector / Taints / Tolerations / NodeName / PodFitsHost / PodFitsHostPorts 等）。

---

### 7. 解释 etcd 的 Raft leader election

**及格线**：能讲清楚 term / vote / heartbeat 三个概念 + 选举过程。

---

### 8. 解释 K8s 的三种 probe

**及格线**：区分 LivenessProbe / ReadinessProbe / StartupProbe 三个的语义和使用场景。

---

## 备注

- 中级岗重点看"基础功"（编码 + 概念）
- 必考一题"口述概念"，看知识深度
- 编码题用户答得快 → 升级到 senior 题
