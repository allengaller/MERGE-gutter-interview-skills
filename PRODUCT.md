# Product

<!-- impeccable:product-schema 1 -->

## Platform

web

## Stack

纯静态单文件 HTML/CSS（零构建、零依赖），可直接部署到 GitHub Pages 或任何静态托管。

## Users

主用户：备战面试的中文工程师——云原生 SRE、AI 智能体工程师、全栈 SA 岗。他们处于换工作准备期，手上有能加载 SKILL.md 的 agent（Claude Code / MiniMax / 任何兼容 agent），需要真实感的模拟面试而不是读题库。
次级用户：想给 skill 扩展新角色/新题库的 skill 作者。

**[假设，待用户确认]** GTM 页面受众即上述主用户，中文优先；部署目标 GitHub Pages。

## Product Purpose

Interview Coach 让任意兼容 SKILL.md 的 agent 扮演经验丰富的面试官：按 flow 推进对话、追问、复述确认、按 rubric 评分、给出可执行的改进建议。把面试练习从"读题库"变成"被面试"。成功 = 用户完成一轮完整面试并收到结构化评分反馈，进而在真实面试中表现更好。

## Positioning

双形态设计（Skill 是入口、知识库是弹药）+ 对话驱动评分。v1 是给人读的题库站点；v2 是给 agent 加载的面试官行为规范。区别于刷题平台：不是做题，是被面试、被追问、被 rubric 打分。rubric + flow + 角色卡 + 用户背景四位一体，这个组合竞品无法直接照抄。

## Operating Context

- 在终端/agent 内触发：用户说「练个面试」「按 X 岗面试我」「评价一下我的回答」
- 4 个 flow：系统设计 / 编码 / 行为 / 故障复盘（SRE 特有）
- CONFIG.md 提供 12 个可配置维度（严格度 / 时长 / 追问层级 / 反馈风格等）
- 全程中文对话；评分按 rubric 维度打分；反馈结构固定（总评 / 亮点 / 可改进 / 推荐练习 / 综合分）
- 追问最多 3 层；不替用户答题；提示方向最多给 30%

## Capabilities and Constraints

- 首批角色：cloud-native-sre、ai-engineer、fullstack-sa；后端/数据计划中
- 不绑定任何具体岗位或公司；新增角色 = 画像 + 技能树 + 分级题库 + 角色卡三处文件
- 知识库（题库/主题/用户背景）按需被 skill 引用

## Brand Commitments

- 名称：Interview Coach（曾用名 Gutter · Get A Better Job / Gutter v2）
- 仓库：github.com/allengaller/gutter-interview-skills

## Evidence on Hand

- README.md、.claude/skills/interview-coach/SKILL.md — 真实产品行为规范
- knowledge/ 下的真实题库、角色画像、rubric — 可作为页面演示素材来源
- 面试对话示例可以合成，但须标注为演示数据
- **无**用户见证、使用数据、基准测试 — 不得虚构

## Product Principles

1. 对话驱动，不是题库浏览——练是被追问，不是被阅读
2. 反馈必须可执行——每个改进点带「下次怎么做」，不打哈哈
3. 诚实评分——不及格直接说不及格，提示最多给 30%
4. 双形态互为表里——skill 是入口，知识库是弹药

## Accessibility & Inclusion

中文优先；代码、终端、技术名词保留英文原文。无其他特别记录。
