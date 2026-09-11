# Topic · 可观测性（Observability）

> 给 interview-coach skill 加载。
> 主路径 + 三大支柱 + SLO 体系 + 关键 trade-off。

---

## 三大支柱 + 实战取舍

### 1. Metrics（指标）
- **代表**：Prometheus + Grafana
- **数据模型**：时间序列 `{metric, label_set, timestamp, value}`
- **采集方式**：pull（Prometheus 自己抓）或 push（agent 推）
- **优势**：聚合计算强、存储紧凑、适合 SLO / 容量规划
- **劣势**：高基数（high cardinality）爆炸、采样后丢细节
- **关键 trade-off**：
  - 5s 抓一次 vs 30s 抓一次：精度 vs 存储 / 抓取开销
  - 全量保留 vs 降采样：成本 vs 查询精度
  - Remote write：长期存储用 Thanos / Mimir / VictoriaMetrics（**不推荐 Prometheus 本地存**）

### 2. Logs（日志）
- **代表**：ELK（Elasticsearch + Logstash + Kibana）/ Loki
- **数据模型**：结构化（JSON）或非结构化（raw text）
- **采集方式**：push（Fluentd / Vector → collector → store）
- **优势**：细节全、能 grep、能查上下文
- **劣势**：存储贵、查询慢
- **关键 trade-off**：
  - 全量 vs 采样：错误率上升时全量，平时采样
  - 解析时（parser in collector）vs 查时（query time）：前者存储贵但查得快
  - 字段化 vs 自由文本：前者结构好但灵活性差

### 3. Traces（链路追踪）
- **代表**：Jaeger / Tempo / Zipkin
- **数据模型**：trace = 树结构（多个 span）+ context propagation
- **采集方式**：agent 自动注入（OpenTelemetry SDK）
- **优势**：跨服务追踪慢请求
- **劣势**：采样率决定全貌（特别是低概率慢请求）
- **关键 trade-off**：
  - 头部采样 vs 尾部采样：前者快但可能错过有价值的，后者按规则采样
  - 100% 采样：成本高但最准（金丝雀阶段）
  - 0.1% 采样：生产常态

## 数据模型对比

| 维度 | Metrics | Logs | Traces |
|------|---------|------|--------|
| 数据量 | 小（KB 级/指标） | 大（每行几百字节） | 中（每 span 几百字节） |
| 存储时长 | 长期（年） | 短期（7-30 天 + 部分归档） | 短期（7-14 天） |
| 查询延迟 | 快（秒级） | 慢（分钟级） | 中（秒到分钟） |
| 适合场景 | 趋势 / SLO / 告警 | 故障定位 / 上下文 | 链路分析 |

## SLO 体系

### 三层目标

1. **SLI (Service Level Indicator)**：可测量指标
   - "请求成功率 = 2xx / 全部请求"
   - "延迟 P99 < 500ms"
2. **SLO (Service Level Objective)**：SLI 的目标值
   - "过去 30 天成功率 ≥ 99.9%"
3. **SLA (Service Level Agreement)**：对外的承诺（带赔偿条款）

### 错误预算（Error Budget）
- **核心思想**：1 - SLO = 可容忍的错误率
- 例：SLO 99.9% → 月可出错 43.2 分钟
- **用法**：
  - 错误预算没花完 → 可以推新功能 / 做变更
  - 错误预算花完了 → 冻结发布，专心稳定

### 关键 trade-off
- **SLO 高** → 用户体验好 → 研发压力大
- **SLO 低** → 研发能快速迭代 → 用户体感差
- **业界经验**：核心服务 99.95% - 99.99%，周边服务 99.5% - 99.9%

## 告警设计（关键面试点）

### 三档告警

| 级别 | 谁响应 | 响应时间 | 例子 |
|------|--------|---------|------|
| **Critical** | oncall 立即 | < 5 分钟 | 用户可见的 P0 故障 |
| **Warning** | oncall 当班 | < 4 小时 | 错误率上升但未影响 SLO |
| **Info** | 邮件 / Slack | 次日处理 | 容量预警（3 天后满） |

### 告警必须满足**三个不**（Google SRE book）

1. **不要发"重复"**——相同问题聚合（`group_by` + `summary`）
2. **不要发"过期"**——`for: 5m` 让瞬时抖动不告警
3. **不要发"无解"**——没 runbook 的告警等于噪声

### 告警降噪实战
- **抑制（inhibition）**：核心服务挂了，自动抑制下游告警
- **静默（silence）**：已知变更窗口 / 计划维护，不响告警
- **路由（route）**：不同服务 → 不同 oncall 团队

## 工具链选型

### Metrics 选型
| 规模 | 方案 | 容量 |
|------|------|------|
| < 100w 时间序列 | Prometheus 单机 | < 50GB / 30 天 |
| 100w - 1000w | Prometheus + Thanos / Mimir | horizontal scale |
| > 1000w | VictoriaMetrics Cluster / Cortex | 长期专业方案 |

### Logs 选型
| 场景 | 方案 | 备注 |
|------|------|------|
| 中小规模 | ELK | 功能全但重 |
| 云原生 | Loki + Grafana | 跟 metrics 统一查询 |
| 大规模 | ClickHouse / 阿里云 SLS | 自建成本高 |

### Traces 选型
| 场景 | 方案 |
|------|------|
| 跨云厂商 | Jaeger |
| 跟 metrics 统一存储 | Tempo |
| 大厂专业方案 | 字节自研 / 阿里鹰眼 |

## 关键 trade-off（面试必聊）

### 1. 全量采集 vs 成本
- 业界经验：生产采集覆盖率 < 50%，头部业务才全量
- **降采样**：5 分钟内的数据全量，更老的降采样到 1 分钟 / 5 分钟精度

### 2. 实时 vs 准确
- 实时指标：5 秒延迟，5 分钟粒度，告警准
- 离线计算：小时 / 天维度，趋势分析准，但告警滞后

### 3. 自研 vs SaaS
- Datadog / NewRelic：开箱即用但贵（$15-30/host/月）
- 自研：成本可控但运维复杂
- **关键判断**：50 台以下用 SaaS，500 台以上自研

## 常见误区（90% 候选人栽）

- ❌ "装了 Prometheus 就有可观测性"——其实只装了一项，需要 logs / traces / events 配合
- ❌ "告警越详细越好"——其实告警越少越值钱，每条必须 actionable
- ❌ "SLO 一定要 99.99%"——其实是分级核心系统才需要，周边系统 99.5% 合理
- ❌ "metric label 越多越好"——其实高基数会爆 Prometheus，必须限制
- ❌ "trace 是 debug 神器"——其实生产 0.1% 采样下，慢请求才看得到

## 面试钩子

**及格线**：能讲清以下任一题 → Senior
- "SLO / SLI / SLA 区别 + 错误预算怎么算"
- "告警设计的"三个不"是什么"
- "Prometheus vs VictoriaMetrics vs Thanos 区别"
- "生产 metrics 存多久？怎么降采样"

**加分项**：
- 知道 OpenTelemetry 是 CNCF 标准
- 用过 recording rule / remote write
- 谈过 SLO burn rate（错误预算燃烧速率）

**追问方向**：
- "你的核心服务 SLO 是多少？怎么定的？"
- "告警降噪怎么做？哪些规则？"
- "成本最大头在哪里？怎么优化？"

---

**维护者注**：本文档每半年 review 一次。可观测性工具链演进快（OTel 已成标准）。
