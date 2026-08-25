# Interview Coach · 配置开关

> **整个对话的各方面都可以配置**。这里集中列出可调参数。
> agent 加载 skill 后，按这里的默认值运行；用户在 prompt 里覆盖即可生效（无需改 skill）。

---

## 用法

用户可在启动 prompt 里指定配置，覆盖任何默认值：

```
按 interview-coach skill 给我来一轮 {flow} 面试，{role} 岗，{level} 经验。
- 严格度：{严格度}
- 时间：{时间} 分钟
- 追问层级：{N} 层
- 反馈风格：{风格}
- 跳过阶段：{stages to skip}
- 自定义题：{你的题}
```

agent 收到配置后按本次会话生效，**不影响默认**。

---

## 维度速查表

| 维度 | 默认值 | 可选值 | 适用场景 |
|------|--------|--------|---------|
| **严格度** | `balanced` | `lenient` / `balanced` / `strict` / `brutal` | 模拟真实面试难度 |
| **时长** | flow 默认 | 数字（分钟） | 时间紧就缩短 |
| **追问层级** | `3` | `0`-`5` | 时间紧或题少就调低 |
| **触发场景** | 主动触发 | system-design / coding / behavior / incident-response / quick-fire / mixed | 选单一或混合 |
| **题目难度** | level 默认 | Junior / Mid / Senior / Staff+ | 直接调难度 |
| **反馈时机** | 用户主动 | auto-mid / auto-end / on-demand | 想要实时点评就 auto |
| **反馈详细度** | `standard` | brief / standard / detailed | 想要讲透就 detailed |
| **反馈风格** | `direct` | supportive / direct / harsh | 用户信心不同 |
| **评分粒度** | 全维度 | single / per-dimension / per-stage | 多维度反馈 |
| **并行追问** | `false` | true / false | advanced 流可开 |
| **对话语言** | 中文 | zh / en / mixed | 看用户偏好 |
| **角色数量** | 单角色 | single / dual | dual=两个面试官对辩 |

---

## 详解 + Prompt 示例

### 1. 严格度（difficulty）

| 级别 | 含义 | 适用 |
|------|------|------|
| `lenient` | 答到 60% 算及格，给提示 | 初级练 / 自学 |
| `balanced` | 答到 70% 算及格 | 默认 |
| `strict` | 答到 85% 算及格，少量提示 | 中级练 / 真面试模拟 |
| `brutal` | 答不完整直接说"不够" | 高压模拟 |

**示例**：
```
按 interview-coach skill 给我来一轮系统设计面试，云原生 SRE 岗，5 年经验。
- 严格度：strict
- 反馈风格：direct
```

### 2. 追问层级（probing depth）

- `0`：**纯答题**，问完即下一个
- `1`：表层追问（确认理解）
- `2`：常规追问（深入细节）
- `3`（**默认**）：进到"为什么这么选"的层级
- `4`：扎到"系统性根因"
- `5`：挖到底（适合 staff+ 模拟）

### 3. 触发场景（flows）

| 场景 | 用途 | 时长 |
|------|------|------|
| `system-design` | 系统设计 | 45-60 分钟 |
| `coding` | 编码 | 30-45 分钟 |
| `behavior` | 行为 | 30 分钟 |
| `incident-response` | 故障复盘（SRE 限定）| 30-45 分钟 |
| `quick-fire` | 快速问答（5-10 题） | 5-15 分钟 |
| `mixed` | 混合 | 60+ 分钟 |

**示例**：
```
按 interview-coach skill 快速来 5 道 quick-fire，每题追问 1 层。
- 严格度：strict
```

### 4. 反馈时机（feedback timing）

- `auto-mid`：**过程中**就给反馈（实时点评）
- `auto-end`：**结束时**统一给反馈（默认）
- `on-demand`：用户**主动**问才给

### 5. 反馈详细度（feedback detail）

- `brief`：亮点 + 短板 + 一个建议（30 秒读完）
- `standard`（默认）：亮点 + 短板 + 改进 + 推荐练习
- `detailed`：每个维度都拆开讲 + 引用原话 + 改写示例 + 推荐题库

### 6. 反馈风格（feedback tone）

| 风格 | 描述 | 适合 |
|------|------|------|
| `supportive` | 多鼓励，先夸后批 | 信心不足 / 校招 |
| `direct`（默认） | 直接说，平实 | 大多数 |
| `harsh` | 像真实 leader 面，残酷 | 抗压模拟 |

### 7. 评分粒度（score granularity）

- `single`：一个总分
- `per-dimension`（默认）：每个 rubric 维度都给分
- `per-stage`：每个阶段单独评分（适合演练后自评）

### 8. 对话语言（language）

- `zh`（默认）：全中文
- `en`：全英文
- `mixed`：中英混排（技术词英文、解释中文）

### 9. 角色数量（interviewer count）

- `single`（默认）：一个面试官
- `dual`：两个面试官**对辩**（一个问技术、一个问业务/behaviour）—— 适合压力面试模拟

**示例**：
```
按 interview-coach skill 给我来一场双面试官对辩：技术（SRE）+ 行为（leadership）。
- 严格度：brutal
```

### 10. 自定义题（custom question）

用户可自带题目让 agent 按 flow 流程追问：

```
按 interview-coach skill 给我出一轮系统设计面试，题目是：设计一个 K8s 多集群配置分发系统。
- 严格度：strict
- 追问层级：4
```

---

## 默认值对照（与 SKILL.md 一致）

| 项 | 默认 |
|----|------|
| 一次只问 1 个问题 | ✅ |
| 用户回答先复述再追问 | ✅ |
| 最多 3 层追问 | ✅ |
| 全程中文（除非用户切英文）| ✅ |
| 不及格要直接说 | ✅ |
| 老师不是答题者，最多多给 30% 提示 | ✅ |

---

## 高级用法示例

### A. 模拟完整的"真实"面试套题

```
按 interview-coach skill 给我来一套模拟考：
- 岗位：云原生 SRE · Senior · 60 分钟
- 流程：系统设计 30min + 行为 15min + 故障复盘 15min
- 严格度：strict
- 反馈详细度：detailed
- 反馈时机：auto-end
```

### B. 练 STAR 但只针对 1 个主题

```
按 interview-coach skill 给我来 3 道行为题（主题：影响力）。
- 追问层级：2
- 反馈风格：supportive
```

### C. 高强度模拟

```
按 interview-coach skill 来一轮系统设计 + 双面试官。
- 严格度：brutal
- 角色数量：dual
- 反馈风格：harsh
```

### D. 短时多题

```
按 interview-coach skill 给我 quick-fire 10 题，云原生 SRE senior。
- 严格度：strict
- 追问层级：1
- 时长：15 分钟
```

---

## 优先级规则

如果用户同时给了多个维度，agent 内部按这个优先级：

1. **role + level** → 决定 flow 默认 + 必问主题
2. **duration** → 决定题目数量 / 追问层级
3. **严格度** → 决定及格线 + 反馈风格
4. 其他配置项 → 按用户标注覆盖

> 重复出现的参数：**用户最后说的覆盖之前说的**（最后一次为准）。

---

## 维护

- 本文档是 skill 的"控制面板"，**新增维度只需在这里加一行**
- 修改默认值时，记得同步更新 `SKILL.md` 里的通用规则
- 半年 review 一次

---

**维护者注**：可配置化是这个 skill 的关键差异化能力——同一份 prompts/quick-start.md 模板可以满足 1v1 模拟、压力面试、刷题、深度复盘多种用法。
