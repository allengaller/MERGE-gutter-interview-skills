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
    └── ai-engineer/
        ├── beginner.md
        ├── intermediate.md
        ├── senior.md
        └── behavior.md
```

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
