# Interview Coach — Skill 形态说明

> 给 skill 作者 / 维护者看的。如果你只是想用这个 skill，去读仓库根目录的 `README.md`。

## 目录结构

```
.claude/skills/interview-coach/
├── SKILL.md              # 主入口，agent 加载它
├── README.md             # 你正在读
├── flows/                # 面试流程
│   ├── system-design.md
│   ├── coding.md
│   ├── behavior.md
│   └── incident-response.md
├── roles/                # 角色卡（面试官画像）
│   ├── _template.md      #   新增角色时的模板
│   ├── cloud-native-sre.md
│   └── ai-engineer.md
├── rubrics/              # 评分维度
│   ├── system-design.md
│   ├── coding.md
│   ├── behavior.md
│   └── incident-response.md
└── prompts/              # 启动 prompt 模板
    └── quick-start.md
```

## 设计原则

1. **SKILL.md 是入口，但 description 是触发器**。description 字段会被宿主 agent 读用来判断何时加载本 skill，所以**触发关键词要全**。

2. **角色卡 = 面试官剧本**。`roles/<role>.md` 告诉 agent"你现在是谁""你考察什么""你的红线是什么"。**不要把用户背景也写这里** — 用户背景在 `knowledge/roles/<role>/` 里。

3. **流程文件 = 推进剧本**。`flows/<flow>.md` 写阶段、推进规则、信号识别（用户什么时候卡住、什么时候要追问）。不要在流程里写具体题。

4. **题库 = 弹药**。`knowledge/questions/<role>/` 才是真题目。Skill 入口**不存题**，避免双份维护。

5. **rubric = 评分卡**。`rubrics/<flow>.md` 是结构化评分维度；收尾时按这个打分。

## 新增角色 / 新增流程

### 新增角色
1. 复制 `roles/_template.md` → `roles/<新角色>.md`，填字段
2. 在 `knowledge/roles/<新角色>/` 建 `README.md`、`projects.md`、`skills.md`
3. 在 `knowledge/questions/<新角色>/` 建 `beginner.md`、`intermediate.md`、`senior.md`
4. 在 SKILL.md 的"文件索引"表里加一行

### 新增流程
1. 在 `flows/<新流程>.md` 写阶段和规则
2. 在 `rubrics/<新流程>.md` 写评分维度
3. 如果是某角色特有的，在该角色的"默认流程"里指过来
4. 在 SKILL.md 的"文件索引"表里加一行

## 与 knowledge/ 的边界

| 维度 | 在 skill 里 | 在 knowledge 里 |
|------|------------|----------------|
| 面试官怎么演 | ✅ roles/ | ❌ |
| 流程怎么走 | ✅ flows/ | ❌ |
| 怎么打分 | ✅ rubrics/ | ❌ |
| 题库（具体题） | ❌ | ✅ questions/ |
| 主题知识 | ❌ | ✅ topics/ |
| 用户背景 | ❌ | ✅ roles/<role>/ |
