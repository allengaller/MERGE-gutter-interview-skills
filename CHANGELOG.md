# Changelog · gutter-interview-skills

> 所有重要变化都写在这里。版本号遵循 [SemVer](https://semver.org/lang/zh-CN/)。
> 文件格式参考 [Keep a Changelog](https://keepachangelog.com/zh-CN/)。

---

## [v0.4.3] - 2026-09-02

**AI SA 岗位细分题库**：阿里云 SA 细分 Agent 工程 / AI Infra 两方向，各备一套专业轮题库，参考答案按线上最佳实践口径。

### ✨ 新增（Added）
- `knowledge/questions/ai-sa/README.md` — 细分导航：三线对比（全栈 SA / Agent 工程 / AI Infra 的核心命题与客户对话层级）、专业轮文件索引、**通用轮复用设计**（HR / 高管 / 压力轮 + 快问快答直接复用 fullstack-sa）
- `knowledge/questions/ai-sa/agent-engineering.md` — Agent 工程方向 **13 题**（方案面 6 + 技术面 7）：
  - 线上最佳实践主线：先单后多编排、工具粒度 + 结构化错误、分级护栏（读自动 / 写审批 / 高危双审 + 沙箱 + 最小凭证 + 审计）、三层幻觉治理、固定归因顺序（语料→检索→推理）、评测驱动运营闭环
  - 结合个人真实弹药：mcp-database（37 个 MCP Server）答供应链安全，ResolveAgent 真实迭代答评测运营
- `knowledge/questions/ai-sa/ai-infra.md` — AI Infra 方向 **13 题**（方案面 6 + 技术面 7）：
  - 线上最佳实践主线：业务画像倒推算力规划（并发→token→卡数 ×1.3-1.5 冗余）、TCO 四本账、KV cache 显存数学、PD 分离的规模门槛与 KV 传输代价、量化选型 + 评测回归 + 灰度、慢节点检测与自动摘除、GPU 拓扑感知调度 / gang scheduling
  - K8s 调度题标注 ACK 三年主场；GPU 推理栈按角色卡口径诚实标注相对弱项并给补法

### 📝 文档（Documentation）
- `knowledge/README.md` — 结构树新增 `questions/ai-sa/` 分支，文件清单同步至 34 文件（补录此前遗漏的 `resume/resume-sa.md`；角色卡路径修正为 skill 内 `.claude/skills/interview-coach/roles/fullstack-sa.md`）
- `fullstack-sa/README.md` — 导航补充 ai-sa 细分题库入口（通用轮复用关系）

---

## [v0.4.2] - 2026-08-31

**简历模板**：投递期启动，新增预填式简历模板。

### ✨ 新增（Added）
- `knowledge/resume/resume-template.md` — 简历模板（全栈 SA 版，已预填）：
  - 按全栈 SA JD 能力模块组织「核心能力」关键词区（ATS 匹配）
  - 工作经历四段递进叙事（TAM → SRE → ACK → Agent）+ 重点项目 A 版商业闭环叙事
  - 开源作品集区（证明"动手实操"）、SA 量化维度速查表、投递前 10 项 ATS 自查清单
  - 数字与快问快答「数字弹药卡」口径一致（文末口径纪律互相引用）

### 📝 文档（Documentation）
- `knowledge/README.md` — 结构树新增 `resume/` 分支，文件清单同步至 30 文件

---

## [v0.4.1] - 2026-08-31

**全流程快问快答**：五轮题库的速记版，面试前突击用。

### ✨ 新增（Added）
- `knowledge/questions/fullstack-sa/quickfire-full-process.md` — 全面试流程**快问快答**：
  - 56 题五轮速记版（每题 30 秒级答案 + 红线）
  - **数字弹药卡**：项目数字连同口径一起背（面试官必深挖分子分母）
  - 自我介绍三版本（30 秒 / 60 秒 / 3 分钟）
  - 谈薪四步话术、反问清单、红线速查总表、面试前 24 小时清单
- 素材来源：全栈 SA 岗位 JD + 个人职业素材库（oh-my-career）+ 求职方法论库（standup-coder-database）

### 📝 文档（Documentation）
- `fullstack-sa/README.md` — 导航补充快问快答入口，标注与题库口径一致
- `knowledge/README.md` — 文件清单同步至 29 文件

---

## [v0.4] - 2026-08-28

**全栈 SA 多轮面试题库**：基于真实岗位 JD，新增第 3 个角色（全栈 SA），按完整面试链路组织。

### ✨ 新增（Added）
- `.claude/skills/interview-coach/roles/fullstack-sa.md` — 全栈 SA 面试官角色卡
- `knowledge/questions/fullstack-sa/` — **56 题**五轮面试题库：
  - `README.md` — 五轮导航 + JD 能力模型映射
  - `round1-hr.md` — 10 题（HR 初面：动机/稳定性/薪资/软技能）
  - `round2-solution.md` — 13 题（业务方案面：需求洞察/架构/选型/合规/POC/差异化/招投标/演示，核心轮）
  - `round3-technical.md` — 10 题（技术深度面：RAG/推理优化/微调/云架构/动手）
  - `round4-executive.md` — 12 题（高管面：战略/商业洞察/跨 BU 赢单/能力沉淀/产品反馈/价值观）
  - `round5-stress.md` — 11 题（压力终面：抗压/真实性/逻辑一致性/价值观底线）
- 每题含 **追问 / 参考要点 / 红线**；Round 2/3/4 共用同一制造业客户贯穿场景
- 对照 JD 逐模块查漏补缺：补上**招投标策略、标杆案例与场景化演示、能力沉淀与赋能、产品需求反向反馈**四个缺口

### 🔧 修复（Fixed）
- `round2-solution.md` Q7 — 估算规模数字从"2 万并发"改为合理量级（日均 5 万问答 / 高峰并发 500），并加入"敢质疑不合理前提"的加分项

### 📝 文档（Documentation）
- `knowledge/README.md` — 文件清单同步至 28 文件 / 200+ 题 / 3 角色，标注全栈 SA 多轮链路

### 💭 设计变化（Changed）
- **JD 能力模型 → 轮次映射表**：每题可追溯到 JD 具体能力项，练习时能精准定位短板
- **多轮交叉验证意识**：前后轮会互相验证候选人说过的话，贯穿场景保持口径一致

---

## [v0.3] - 2026-08-25

**质量评估 + 修复期**：根据项目质量评估的发现，结构性补全内容。

### ✨ 新增（Added）
- `knowledge/topics/` — 6 个主题文件齐了（之前是空目录）
  - `k8s-internals.md`（主路径 + 16 谓词 + 调度 framework）
  - `etcd-raft.md`（Raft 三大概念 + etcd 实战）
  - `observability.md`（三大支柱 + SLO + 告警）
  - `agent-architectures.md`（ReAct / Plan-Act-Reflect / Reflexion + 失败模式）
  - `rag-pipeline.md`（chunking / embedding / retrieval / rerank / eval 全链路）
  - `mcp.md`（MCP 协议 + 安全 + token 优化）
- `knowledge/questions/cloud-native-sre/beginner.md` — 17 题（之前缺失）
- `knowledge/questions/ai-engineer/beginner.md` — 18 题（之前缺失）
- `knowledge/questions/ai-engineer/scenarios.md` — 8 道 AI 故障题（之前缺失）
- `.claude/skills/interview-coach/roles/_template.md` — 新增角色的必填模板（之前 README 引用但不存在）
- `.claude/skills/interview-coach/CONFIG.md` — **12 个可配置维度**（严格度 / 时长 / 追问层级 / 反馈风格 / 双面试官 / 语言 / 等），用户 prompt 里覆盖即生效

### 🔧 修复（Fixed）
- `knowledge/questions/cloud-native-sre/scenarios.md` line 86 — "Istro" 拼写错误 → "Istio"
- `knowledge/roles/*/projects.md` — 把"5 个已沉淀"虚标改成"3 已沉淀 + 2 留白位"（真实状态），并把留白位从"占位文本"升级为"留白模板"（含结构化字段引导）

### 📝 文档（Documentation）
- `SKILL.md` "文件索引"表 — 加上 `_template.md` 和 `CONFIG.md`
- `knowledge/README.md` "当前状态"表 — 改成实际文件清单 + 22 文件 / 150+ 题 / 9 留白位 的统计 + 下一版计划 checklist

### 💭 设计变化（Changed）
- **可配置化作为一等公民**：之前 skill 行为是固定的，现在 12 个维度都能从 prompt 调
- **留白位 (留白) 而不是占位 (占位)**：避免 agent 用伪答案填，留白位有结构但内容必须用户补

---

## [v0.2] - 2026-08-04

### ✨ 新增（Added）
- v1 → v2 架构切换：从 PHP/Yii 站点 → Claude Skill + Knowledge 双形态
- `archive/` 完整保留 v1 历史（Yii 代码 + 老文档）
- 2 个 role 卡（cloud-native-sre / ai-engineer）
- 4 个 flow（system-design / coding / behavior / incident-response）
- 4 个 rubric
- 2 套题库（部分） + 2 套用户背景卡

### 📝 文档
- `README.md` 双形态设计说明
- `SKILL.md` 触发关键词清单
- `quick-start.md` 启动 prompt 模板

---

## [v0.1] - 历史归档（commit `d9b6084`）

初始提交。PHP/Yii + Bootstrap + MySQL 的传统 web 应用：
- `archive/web/public_html/` 完整代码
- `archive/web/doc/` 完整需求 + 设计 + UAT 文档

---

## 维护规范

每次发生下面任一变化，**必须在 CHANGELOG.md 加一行**：
- 新增 / 删除 / 重命名 任何一个 markdown / 配置文件
- 修改 rubric 或 flow 的**默认行为**
- 修改 user role 必填字段（改 `_template.md` 后要同步改所有现存的 role 卡）
- 修改 SKILL.md 的"通用规则"段落

每次 CHANGELOG 变更必须在 commit message 里引用 `CHANGELOG.md`。

---

## 版本策略

- **v0.x**：还在迭代，**任何 commit 都可能改 SKILL.md 行为**
- **v1.0**：行为稳定，新版本不破坏现有流程
- **v2.0**：彻底重构（双形态变更多）

---

**维护者注**：填 CHANGELOG 比写 commit message 重要——半年后你会感谢现在的自己。
