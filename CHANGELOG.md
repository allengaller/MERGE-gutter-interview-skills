# Changelog · gutter-interview-skills

> 所有重要变化都写在这里。版本号遵循 [SemVer](https://semver.org/lang/zh-CN/)。
> 文件格式参考 [Keep a Changelog](https://keepachangelog.com/zh-CN/)。

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
