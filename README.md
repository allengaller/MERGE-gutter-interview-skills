# Interview Coach — 通用面试教练

> Gutter v2 · 对话式面试练习平台 · Skill + 知识库 双形态

## 这是什么

一个**通用 skill**，可以在任何能加载它的智能体（Claude Code / MiniMax / 任何兼容 SKILL.md 规范的 agent）里，跟用户**对话式练面试**。

与 v1 的区别：
- v1：PHP/Yii 站点，靠题库 + 人工阅读
- v2：**对话驱动**，agent 扮演面试官、追问、评分、给出改进建议

## 双形态设计

```
gutter-interview-skills/
├── .claude/skills/interview-coach/    # Skill 形态：给 agent 加载
│   ├── SKILL.md                       #   主入口（description + 触发条件）
│   ├── flows/                         #   面试流程（系统设计/编码/行为/故障复盘）
│   ├── roles/                         #   角色卡（面试官画像）
│   ├── rubrics/                       #   评分维度
│   └── ...
├── knowledge/                         # 知识库形态：给人/agent 直接读
│   ├── roles/                         #   按角色：用户背景画像 + 项目经验 + 技能树
│   ├── topics/                        #   按主题：可复用的知识块
│   └── questions/                     #   按角色分级的面试题库
├── archive/                           # v1 历史归档（git 保留）
└── README.md                          # 你正在读
```

**两个形态互为表里**：
- Skill 是入口 — agent 加载 SKILL.md 后知道"什么时候触发、怎么扮演面试官"
- 知识库是弹药 — 按需被 skill 引用，给 agent 喂上下文和题库

## 首批支持的角色

| 角色 | 说明 | 状态 |
|------|------|------|
| **云原生 SRE** | K8s / etcd / 可观测性 / 故障响应 | ✅ 首批 |
| **AI 智能体工程师** | Agent / RAG / MCP / 智能体语料 | ✅ 首批 |
| 后端 / 全栈 / 数据 | 后续按需扩展 | ⏳ 计划中 |

> 第一版先用我自己的背景（云原生 SRE + AI 智能体开发）打底，跑通流程后再横向扩展。

## 使用方式

### 1. 在 Claude Code / MiniMax 里加载

```bash
# 让 agent 加载这个 skill 即可触发
"按 interview-coach skill 给我来一轮系统设计面试，云原生 SRE 岗，3 年经验"
```

agent 会自动：
1. 读取 `.claude/skills/interview-coach/SKILL.md`
2. 按 `roles/cloud-native-sre.md` 配置面试官
3. 按 `flows/system-design.md` 推进流程
4. 按 `rubrics/system-design.md` 评估回答

### 2. 直接当知识库读

```bash
# 浏览题库
cat knowledge/questions/cloud-native-sre/senior.md

# 看角色画像
cat knowledge/roles/cloud-native-sre/README.md
```

## 触发关键词

加载 skill 后，下列任一关键词都能触发面试模式：

- 「练个面试」「模拟面试」「给我来一轮面试」
- 「这个题怎么答」「评价一下我的回答」
- 「系统设计题 / 编码题 / 行为面试题」
- 「按 [角色] 岗面试我」

## 扩展指南

想加新角色？三步：

1. 在 `knowledge/roles/<新角色>/` 下建 `README.md`（画像）+ `projects.md`（项目经验）+ `skills.md`（技能树）
2. 在 `knowledge/questions/<新角色>/` 下按 beginner/intermediate/senior 建题库
3. 在 `.claude/skills/interview-coach/roles/<新角色>.md` 建角色卡（给 agent 用的精简版）

详见 `knowledge/README.md` 和 `.claude/skills/interview-coach/README.md`。

---

**Old name**: Gutter · Get A Better Job
**New name**: Interview Coach
**Why the change**: v1 是站点，v2 是技能。前者给人看，后者给 agent 加载。
