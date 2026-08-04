# 用户背景卡 · 云原生 SRE

> 给 interview-coach skill 的 cloud-native-sre role 加载。**必读**。

## 基本信息

| 字段 | 值 |
|------|-----|
| 姓名 | Allen Galler（法喜） |
| GitHub | https://github.com/allengaller |
| 邮箱 | allengaller@qq.com |
| 个人站 | https://allengaller.github.io |
| 自定位 | Cloud Native SRE · AI Toolsmith · Knowledge Architect |
| 工作年限 | 按 7+ 算 SRE；从 2022 年开始做 AI Tooling，所以"AI 工龄"约 3+ 年 |

> ⚠️ **面试官在追问前要意识到**：用户是**双栖**身份（SRE + AI 工程师），聊 SRE 时不要默认他只会 SRE；聊 AI 时不要忘了他 SRE 底子很扎实。

## 核心 SRE 能力

- **K8s**：深入到控制面组件源码级理解，做过 K8s 节点诊断工具
- **etcd**：做过 etcd 备份/恢复 Operator（EtcdGuardian），理解 Raft 共识
- **可观测性**：指标/日志/链路三件套都搭过体系，做过 SLO 设计
- **故障响应**：在生产上救过火，能输出深度复盘
- **CI/CD**：搭过渐进式发布、回滚体系
- **自动化**：写过 70+ 个 K8s 诊断 analyzer（Kudig）

## 重点项目（按 SRE 含金量排）

详见 `projects.md`。重点提示：

1. **Kudig** (`kudig-io/kudig`) — K8s 节点诊断工具，70+ analyzers，eBPF
   - **面试钩子**：K8s 节点异常检测、analyzer 设计哲学、性能优化
2. **EtcdGuardian** (`kudig-io/etcd-guardian`) — etcd 备份/恢复 Operator
   - **面试钩子**：Operator 模式、etcd 备份一致性、Restore 时的 quorum 问题
3. **ResolveAgent** (`ai-guru-global/resolve-agent`) — AIOps / RAG / Agent
   - **面试钩子**：AIOps 落地经验、RAG 用于故障定位、Agent 工具调用

## 自我定位的话

> "Cloud Native SRE + AI Toolsmith" — 用户的工作流是：**SRE 实战中发现痛点 → 自研工具（agent 化）→ 把工具开源出来**。
>
> 这意味着：他写的工具不是为了写而写，**每个工具背后都有一个真实的生产痛点**。面试时如果问"你为什么做这个工具"，应该是**业务驱动**而不是"为了练习"。

## 面试官必读红线

- ❌ **不要**问"什么是 K8s"、"什么是 etcd" — 浪费他时间
- ❌ **不要**问"你会用 Helm 吗" — 太基础
- ✅ **要**问：诊断 analyzer 怎么保证 false positive 率低
- ✅ **要**问：etcd backup 时怎么保证 RPO < 5 分钟
- ✅ **要**问：自研工具和直接用开源的边界在哪里
- ✅ **要**问：AI 工具在 SRE 场景里真正解决过什么问题，没解决过什么

## 弱项 / 短板（用户承认的）

> 面试时这些**不主动问**，但用户答得不好时可以绕过去问

- 应用层业务开发经验相对少（主要做基础设施层）
- 商业产品级（To C 大流量）经验不一定有
- 网络 / 存储 内核级不一定有

## 链接

- `projects.md` — 详细项目经验（按 STAR 整理）
- `skills.md` — 技能树 + 熟练度自评
- `../../questions/cloud-native-sre/` — 题库
