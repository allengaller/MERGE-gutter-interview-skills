# Knowledge · 知识库

> 给 interview-coach skill 用的弹药库。也是**人可以直接读**的 markdown 知识库。

## 结构

```
knowledge/
├── roles/                         # 用户背景画像（agent 必读）
│   ├── cloud-native-sre/          #   云原生 SRE
│   │   ├── README.md              #     画像
│   │   ├── projects.md            #     项目经验（按 STAR 整理）
│   │   └── skills.md              #     技能树 + 熟练度自评
│   └── ai-engineer/               #   AI 智能体工程师
│       ├── README.md
│       ├── projects.md
│       └── skills.md
├── topics/                        # 主题知识块（按需引用）
│   ├── k8s-internals.md           #   K8s 内部机制
│   ├── etcd-raft.md               #   etcd / Raft
│   ├── observability.md           #   可观测性
│   ├── agent-architectures.md     #   Agent 架构模式
│   ├── rag-pipeline.md            #   RAG 全链路
│   └── mcp.md                     #   MCP 协议
└── questions/                     # 面试题库
    ├── cloud-native-sre/
    │   ├── beginner.md            #   0-2y
    │   ├── intermediate.md        #   2-5y
    │   ├── senior.md              #   5y+
    │   ├── behavior.md            #   行为面试
    │   └── scenarios.md           #   故障场景
    ├── ai-engineer/
    │   ├── beginner.md
    │   ├── intermediate.md
    │   ├── senior.md
    │   ├── behavior.md
    │   └── scenarios.md           # AI 系统故障场景
    └── fullstack-sa/              #   全栈 SA（多轮面试链路）
        ├── README.md              #     五轮导航 + JD 能力映射
        ├── round1-hr.md           #     HR 初面
        ├── round2-solution.md     #     业务方案面（核心）
        ├── round3-technical.md    #     技术深度面
        ├── round4-executive.md    #     高管面
        └── round5-stress.md       #     压力终面
```

## 当前状态（v0.3 → v0.4）

当前文件清单（实际存在的文件）：

| 路径 | 角色 | 状态 |
|------|------|------|
| `roles/cloud-native-sre/README.md` | SRE | ✅ |
| `roles/cloud-native-sre/projects.md` | SRE | 🟢 3 已沉淀 + 2 留白位 |
| `roles/cloud-native-sre/skills.md` | SRE | ✅ |
| `roles/ai-engineer/README.md` | AI | ✅ |
| `roles/ai-engineer/projects.md` | AI | 🟢 4 已沉淀 + 1 留白位 |
| `roles/ai-engineer/skills.md` | AI | ✅ |
| `topics/k8s-internals.md` | SRE | ✅ |
| `topics/etcd-raft.md` | SRE | ✅ |
| `topics/observability.md` | SRE | ✅ |
| `topics/agent-architectures.md` | AI | ✅ |
| `topics/rag-pipeline.md` | AI | ✅ |
| `topics/mcp.md` | AI | ✅ |
| `questions/cloud-native-sre/beginner.md` | SRE | ✅ 17 题 |
| `questions/cloud-native-sre/intermediate.md` | SRE | ✅ 8 题 |
| `questions/cloud-native-sre/senior.md` | SRE | ✅ 5 题 + 3 留白位 |
| `questions/cloud-native-sre/behavior.md` | SRE | ✅ 12 题 |
| `questions/cloud-native-sre/scenarios.md` | SRE | ✅ 8 题 + 2 留白位 |
| `questions/ai-engineer/beginner.md` | AI | ✅ 18 题 |
| `questions/ai-engineer/intermediate.md` | AI | ✅ 10 题 |
| `questions/ai-engineer/senior.md` | AI | ✅ 5 题 + 1 留白位 |
| `questions/ai-engineer/behavior.md` | AI | ✅ 13 题 |
| `questions/ai-engineer/scenarios.md` | AI | ✅ 8 题 + 1 留白位 |
| `questions/fullstack-sa/README.md` | SA | ✅ 五轮导航 + JD 映射 |
| `questions/fullstack-sa/round1-hr.md` | SA | ✅ 10 题（HR 初面） |
| `questions/fullstack-sa/round2-solution.md` | SA | ✅ 11 题（业务方案面） |
| `questions/fullstack-sa/round3-technical.md` | SA | ✅ 10 题（技术深度面） |
| `questions/fullstack-sa/round4-executive.md` | SA | ✅ 10 题（高管面） |
| `questions/fullstack-sa/round5-stress.md` | SA | ✅ 11 题（压力终面） |

**累计**：28 个文件、200+ 道题、9 个留白位、涵盖 3 个角色（SRE / AI / 全栈 SA）。全栈 SA 按**多轮面试链路**组织（HR → 方案 → 技术 → 高管 → 压力），配套角色卡 `roles/fullstack-sa.md`。

**下一版计划**（v0.3+）：
- [ ] CI 加 link-check + markdown-lint，防止声明 vs 现实漂移
- [ ] 添加 2-3 份 **golden trajectory** 示例会话
- [x] 新增全栈 SA 角色（五轮面试题库，基于真实 JD）
- [ ] 新增 backend / fullstack / data 角色（使用 `roles/_template.md`）
- [ ] topics 补全 k8s 网络 / sigs 贡献 等额外主题

## 使用方式

### Agent 加载（推荐）
加载 `.claude/skills/interview-coach/SKILL.md` 后，agent 会**按需**引用 knowledge/ 里的文件。**不要一次性全读**。

### 人工阅读
- 想知道自己的"弹药库"够不够：浏览 `questions/<role>/` 各文件
- 想复习某个主题：读 `topics/<topic>.md`
- 想看自己背景卡：读 `roles/<role>/README.md`

## 维护原则

- **题库**：每周加 1-2 题，写明来源 / 答案 / 难度
- **主题**：按"主路径 + 关键 trade-off"组织，不抄文档
- **背景卡**：项目经验半年内 review 一次，淘汰过时的，加新的

## 当前状态（v0.1）

| 目录 | 完成度 | 备注 |
|------|--------|------|
| roles/cloud-native-sre | 🟡 30% | 首批用户背景，写基础版 |
| roles/ai-engineer | 🟡 30% | 同上 |
| questions/cloud-native-sre | 🟡 50% | 经典题 + 用户自创题 |
| questions/ai-engineer | 🔴 10% | 计划中 |
| topics | 🔴 10% | 占位 |

> 首批只覆盖用户自己的两个角色（云原生 SRE + AI 智能体工程师），跑通后再横向扩展。
