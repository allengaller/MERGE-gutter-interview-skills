# 用户背景卡 · AI 智能体工程师

> 给 interview-coach skill 的 ai-engineer role 加载。**必读**。

## 基本信息

| 字段 | 值 |
|------|-----|
| 姓名 | Allen Galler（法喜） |
| GitHub | https://github.com/allengaller |
| 邮箱 | allengaller [at] qq.com（隐私脱敏，原邮箱可联系作者） |
| 个人站 | https://allengaller.github.io |
| 自定位 | AI Toolsmith · Knowledge Architect · Cloud Native SRE |
| AI 工龄 | 2022 年开始，约 3+ 年 |

> ⚠️ **双栖身份**：用户**先**是 SRE（K8s/etcd/可观测性），**后**转 AI 工具开发。这意味着他的 AI 项目**绝大多数有 SRE / 基础设施背景**（AIOps、agent 工具调用、运维自动化）。
>
> 面试时**不要**默认他是纯 AI 背景 — 这是加分项。

## 核心 AI 能力

- **Agent 架构**：做过自研 agent 框架（ResolveAgent），理解工具调用、规划/反思、错误恢复
- **RAG 全链路**：chunking → 检索 → rerank → 评估，深度实战
- **MCP / 工具协议**：自研过 MCP 工具聚合（mcp4coder），理解工具描述、错误传播、安全边界
- **语料工程**：518+ tech demos（OpenDemo），理解怎么造数据、清洗、dedup
- **AI 产品形态**：做过 podcast AI（LeetCast）、AIOps agent
- **可观测性意识**：从 SRE 带来的，看 agent 必谈可观测性、eval、成本

## 重点项目（按 AI 含金量排）

详见 `projects.md`。重点提示：

1. **ResolveAgent** — AIOps / RAG / Agent，最重磅
2. **mcp4coder** — MCP 工具聚合，理解协议深度
3. **LeetCast** — AI 对话 podcast，产品化思维
4. **OpenDemo** — 518+ tech demos，语料工程能力证明

## 自我定位的话

> "AI Toolsmith" — 用户的核心身份是**造 AI 工具的人**，不是用 AI 工具的人。
>
> 这意味着：面试时如果只问"你怎么用 ChatGPT"，**完全没问到点子上**。应该问"你怎么造一个让 1000 人用的 AI 工具"。

## 面试官必读红线

- ❌ **不要**问"什么是 RAG" — 太基础
- ❌ **不要**问"你用 LangChain 吗" — LangChain 是工具，不是能力
- ❌ **不要**问"你用 prompt 怎么调" — 提示词工程不是 agent 工程
- ✅ **要**问：agent 在生产上的失败模式（failure mode）有哪些
- ✅ **要**问：RAG 的 eval 怎么做，baseline 是？
- ✅ **要**问：MCP 工具的 token 成本怎么算
- ✅ **要**问：造语料时怎么保证质量 + 版权
- ✅ **要**问：AI 工具的 SLO 怎么定（从 SRE 背景延伸）

## 弱项 / 短板（用户承认的）

> 面试时这些**不主动问**

- 学术 paper 跟进频率不一定高（实战派）
- 训练 / fine-tuning 经验相对少（应用层为主）
- 多模态（图像 / 视频）不一定深

## 链接

- `projects.md` — 详细项目经验
- `skills.md` — 技能树 + 熟练度自评
- `../../questions/ai-engineer/` — 题库
- `../cloud-native-sre/` — SRE 背景（很多项目是双栖）
