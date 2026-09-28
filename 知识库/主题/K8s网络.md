# Topic · K8s 网络

> 给 interview-coach skill 加载。**按需引用**——agent 答网络题时回这里查。
> 主路径 + 关键 trade-off，不抄文档。

---

## 主路径：一次 Service 调用到底走了几步

```
curl http://foo.ns.svc.cluster.local:8080
 ① DNS    ：CoreDNS → 拿到 ClusterIP（虚拟 IP，不在任何网卡上）
 ② 本节点  ：netfilter 命中 kube-proxy 下发的规则 → DNAT 到某个 Pod IP
             **只有新建连接的第一个包做 DNAT**
 ③ conntrack：建一条连接跟踪；后续包不查规则，照条目直接改写
 ④ 路由    ：同节点 → 网桥/veth 直达；跨节点 → CNI（VXLAN 封装 / BGP 路由 / eBPF 直投）
 ⑤ 对端    ：目标节点 veth → Pod netns → 业务进程
```

**面试第一判断线**：①②③ 属"Service 层"，④⑤ 属"CNI / underlay 层"。
所以开口第一句应该是"**同节点通不通、跨节点通不通**"——一刀把故障域切成两半：

- 同节点通、跨节点不通 → CNI 或 underlay（路由没学到 / 封装被安全组挡 / MTU 黑洞）
- 两边都不通 → DNS、Endpoints 为空、或 NetworkPolicy
- **偶发不通 + 时好时坏** → conntrack 打满 或 UDP/DNS 丢包（这条最值钱，见下）

---

## 分层：谁实现什么，出什么现象

| 层 | 谁在做 | 典型故障表现 | 第一手证据 |
|----|--------|-------------|-----------|
| 名字解析 | CoreDNS（本身也是 Deployment，也在网络里） | `NXDOMAIN` / `SERVFAIL` / 解析超时 | `kubectl exec -- nslookup kubernetes.default.svc.cluster.local` |
| ClusterIP 转发 | kube-proxy（iptables / IPVS）或 eBPF 数据面 | 连不上、但 `kubectl get endpoints` 有人 | 节点 `iptables-save` / `ipvsadm -Ln` |
| Pod 互通 | CNI 插件 + 节点路由/overlay | 跨节点不通、大包丢 | `ip route` / `bridge fdb` / 两端抓包 |
| 策略 | CNI 里的 policy 引擎（**不是 kubelet**） | 通了又断、只有某几个目标不通 | CNI 自己的规则（Calico `calico-felix` iptables 链） |
| 南北向 | Ingress Controller / Gateway API 实现 | 5xx、502、TLS 握手失败 | Controller 日志 + 后端 endpoint 健康 |

---

## ClusterIP 的四个反直觉事实（说中任意一条就显出做过生产）

1. **它是虚拟地址**：iptables 模式下不出现在任何网卡（IPVS 模式挂在 `kube-ipvs0` 上）；
   所以"ping 不通 ClusterIP"**不是故障**——kube-proxy 不处理 ICMP。
2. **DNAT 只发生在建连第一个包**：改了 Service selector 之后，**已建立的长连接仍然打到旧 Pod**。
   这不是"缓存 bug"，是 conntrack 语义。
   止血：`conntrack -D -p tcp --orig-dst <ClusterIP>` 精确删表项（生产上先按 Service 范围删，别清全表）；
   根治：客户端要有连接池空闲回收 / 重连周期，或上游做 `readiness` 摘除 + 优雅排空。
3. **Endpoints 空 ≠ Service 不存在**：`kubectl get endpoints foo` 为空时连接表现为**立刻被拒/挂住**，
   而不是 DNS 失败——这一步要先看 selector 与 Pod readiness，别看 CNI。
4. **ClusterIP 只在集群内可路由**：从集群外访问 ClusterIP 需要 kube-proxy 在节点上，
   这就是"为什么 NodePort 能通而 ClusterIP 不通"的答案（节点上有规则，别的机器上没有）。

---

## 数据面选型的代价（必聊 trade-off）

| 方案 | 规则复杂度 | 规模瓶颈 | 备注 |
|------|-----------|---------|------|
| iptables（默认） | 每次同步全量重算，规则数 ~ Service × Endpoint | 千级 Service 后同步延迟明显上升（秒级到十秒级） | 排障入口是 `iptables-save -t nat` + 命中计数 |
| IPVS | 哈希表 O(1)，支持 rr/lc/sch 等 LB 算法 | 仍依赖 conntrack | 需要内核 `ip_vs` 模块；`ipvsadm -Ln` 看真实后端 |
| eBPF（Cilium 等） | 绕开 conntrack 做服务解析 | 复杂策略/可观测性换 CPU 与内核版本要求 | 能给出 per-policy 的执行计数，排障体验最好 |

**红线级误区**：说"换 IPVS 就不用管 conntrack 了"。
IPVS 自己就靠 conntrack 维持已建立连接，**换成 eBPF 才可能绕开**——这两件事经常被说混。

---

## conntrack 与 DNS：大规模集群最常见的两类"网络抖动"

- **表满**：`nf_conntrack_max` 由内核按内存推导（不是固定值，别背数字，说"按内存算、可调"），
  打满时节点 `dmesg` 会出现 `nf_conntrack: table full, dropping packet`——
  **表现是随机丢包，看起来像"网络不稳"**。查：`sysctl net.netfilter.nf_conntrack_count` vs `max`，
  以及 `net.netfilter.nf_conntrack_tcp_timeout_established`（默认可长达数天，是攒表项的主因）。
- **DNS 放大**：Pod 默认 `resolv.conf` 是 `ndots:5` + 4 个 search 域，
  查一个带点的短名会先按 search 后缀试几遍才走绝对域名 → **一次业务解析变成多次查询**，
  UDP 又易丢，于是 conntrack 里塞满 DNS 条目。
  成本从低到高的解法：用 FQDN / 调 `dnsConfig.options ndots:1` / `single-request-reopen` /
  **NodeLocal DNSCache**（把 DNS 变成节点本地 TCP/短路径，也是"CoreDNS 自身被打挂"的兜底）。
- **CoreDNS 挂掉的真实影响**：已建立的连接**不受影响**（走 conntrack），只有新建解析失败。
  能说出这句，说明真理解 ①②③ 的分工。

---

## MTU：跨节点"能连上但大响应体失败"

VXLAN 封装要多吃 50 字节（VXLAN 8 + UDP 8 + 外层 IP 20 + 外层以太 14），
所以 Pod 侧 MTU 常配 1450 而节点网卡 1500。配错就是**ICMP Fragmentation Needed 被挡 → 黑洞**：

- 症状：小包 / 握手正常，**大 body、TLS 握手、镜像拉取**卡住——这是"MTU 黑洞"的形状特征。
- 别用默认 `ping` 自证（32 字节永远通）。要探测 DF：`ping -M do -s 1472 <对端节点 IP>`，
  1472 + 28 = 1500，能过说明节点间 MTU 正常，再往 Pod MTU 与封装头上找。
- 口径：报"我们 Pod 网络 MTU 1450、节点 1500"，别只说"改过 MTU"。

---

## NetworkPolicy：三条容易讲反的语义

1. **按方向生效**：一旦有策略选中某 Pod，该 Pod 的**那个方向**从"默认全通"变成"默认拒绝"。
   只写 ingress 不写 egress → egress 仍全通（很多人以为写了一条就两头都管）。
2. **它是 CNI 的能力，不是 API Server 的**：`kubectl apply` 成功 ≠ 生效。
   不支持策略的 CNI（早期 flannel 裸装、部分云托管集群）会**静默接受不执行**。
   面试加分说法："上线前我会用一个负向用例验：起一个不该被允许的 Pod 去 curl，必须失败。"
3. **放行 DNS 必须显式做**：策略生效后要按 UDP/TCP 53 放行到 kube-dns，否则连名字都解析不了；
   依赖外部域名时，基于 selector 的策略做不到"允许访问某域名"（IP 会变），
   要用 CNI 自己的扩展能力（如 Calico 的 UDR / Cilium 的 FQDN policy）。

**额外一条老手细节**：`hostNetwork: true` 的 Pod 不走 Pod 网络，NetworkPolicy 对它的东西向限制无效。

---

## 南北向：NodePort / Ingress / Gateway API

- NodePort 的端口是**全集群共用资源**（默认区间约 3 万），大规模平台会撞号——
  所以正规做法是云 LB + `type: LoadBalancer` 或统一 Ingress。
- Ingress 的痛点是**一个 Host 上的路由能力弱 + 一份配置多方共改**；
  Gateway API 的关键改进不是"功能更多"，而是**把角色拆开**：
  基础设施方管 Gateway、集群方管 HTTPRoute、应用方只改自己命名空间的路由，
  并原生支持 header 路由、加权分流、跨命名空间引用。
- 502/504 的分界（必背）：**502 = 后端拒连/连接被重置（应用挂了或 endpoint 不健康）；
  504 = 连上了但响应超时（应用慢或超时配短了）**。先分这条，再决定找开发还是找平台。

---

## 排障固定顺序（能背下来，面试就不会乱）

```
1. get svc + get endpoints     ← 一半的"网络故障"在这里就结束了（endpoints 空 = selector/readiness）
2. 从发起端 nslookup（带 FQDN）  ← 分清解析层
3. 同节点 Pod ↔ 目标 试一次，跨节点再试一次  ← 切故障域（这是最关键的一刀）
4. 策略与 kube-proxy：查 CNI policy 命中 / ipvsadm 里有没有这个后端
5. 抓包对比：发起端 veth 有包 + 目标端 veth 没包 = underlay/路由；两端都有 = 上层
```

**止损优先**：先切流量（把 endpoint 摘掉 / 回滚最近变更的那条 Service 或 policy），再深挖。
"先上 tcpdump 抓 20 分钟"在面试里会被判半对——动作没错，顺序错了。

---

## 关键 trade-off（面试必聊）

| 选择 | 换来什么 | 代价是什么 |
|------|---------|-----------|
| Overlay（VXLAN） | 跨节点/跨可用区开箱可用，underlay 不用管 | 封装开销 + MTU 损失 + 抓包看到双层头，排障更绕 |
| BGP 路由型 CNI | 无封装、性能与可观测性最好 | 需要能控制 underlay（ASN、路由通告），公有云里通常受限 |
| Service 用 eBPF 数据面 | 绕开 conntrack 规模瓶颈、per-flow 可观测 | 内核版本/团队学习成本，出问题时需要读 eBPF 程序 |
| NetworkPolicy 全网开启 | 东西向零信任，横向移动被挡住 | 排障多一层，且必须验"真的生效"，否则是心理安慰 |
| NodeLocal DNSCache | 消掉 DNS 抖动与 conntrack 放大 | 每节点一个 DaemonSet，本地缓存带来的配置复杂度 |

---

## 常见误区（90% 候选人栽）

- ❌ "Service 是个进程 / Service 会转发流量"——**没有 Service 进程**，规则在节点 netfilter 里，
  流量根本不经过 apiserver，也不经过 CoreDNS。
- ❌ "ClusterIP ping 不通，所以网络坏了"——它本来就不响应 ICMP。
- ❌ "改了 Service 老连接该立刻切过去"——DNAT 只在建连时生效，切不了是设计不是 bug。
- ❌ "跨节点不通就重启 CNI Pod"——先看 `ip route` / 对端节点安全组 / MTU，重启是掩盖。
- ❌ "NetworkPolicy 建了就是隔离了"——没验过 = 没做（本仓库复盘 rubric 的"改了没验证"同一类扣分）。
- ❌ "换 IPVS 就能解决 conntrack"——需要绕 conntrack 的是 eBPF 数据面。
- ❌ 只报"我们用的 Calico"，说不出 **为什么不是 flannel / Cilium、封装模式是什么、MTU 多少**。

---

## 面试钩子

**及格线**：能讲清以下任一题 → Senior
- "同节点通、跨节点不通，你查什么？"（能否直接落到路由/封装/MTU 三层）
- "改完 Service 为什么还有流量打到旧 Pod？"（conntrack + 止血动作）
- "NetworkPolicy 上线后怎么证明它真的生效？"（负向用例）
- "业务随机超时报 conntrack table full，短期和长期的处置分别是什么？"

**加分项**：
- 报得出 MTU 数字与封装开销的来源（VXLAN 50 字节）
- 知道 `ndots:5` 的代价并给出 NodeLocal DNSCache 这条兜底
- 能对比 iptables / IPVS / eBPF 三种数据面并说清"规模瓶颈在哪一步"
- 主动区分 502 与 504 的责任归属

**追问方向**：
- "你们集群规模多大？Service 数量与 endpoint 数量各是多少？"
- "CNI 是谁装的？托管集群里你能改哪一层？"
- "上一次网络故障的根因最后落在哪一层？"

---

**维护点**：本文档每半年 review 一次。CNI 数据面（尤其 eBPF 与 Gateway API）演进快，
但"①解析 ②DNAT ③conntrack ④路由 ⑤对端"这条分层主线不会变——面试答不上层次时，回到这条线。
