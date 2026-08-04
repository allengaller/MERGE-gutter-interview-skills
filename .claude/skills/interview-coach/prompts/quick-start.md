# Quick-Start · 一句话启动 prompt 模板

> 用户可以用这些句式直接启动面试模式。

## 启动模板

### 按岗位 + 流程

```
按 interview-coach skill 给我来一轮 {flow} 面试，{role} 岗，{level} 经验。
```

例：
- `按 interview-coach skill 给我来一轮 系统设计 面试，云原生 SRE 岗，5 年经验。`
- `按 interview-coach skill 给我来一轮 故障复盘 面试，云原生 SRE 岗，3 年经验。`
- `按 interview-coach skill 给我来一轮 系统设计 面试，AI 智能体工程师 岗，2 年经验。`

### 自带题目

```
按 interview-coach skill 面试我，{role} 岗，题目是：{your question}
```

例：
- `按 interview-coach skill 面试我，云原生 SRE 岗，题目是：etcd 集群失去 quorum 怎么处理。`

### 评价回答

```
按 interview-coach skill 评价下我的回答：{your answer}
```

### 模拟考

```
按 interview-coach skill 给我来一场模拟考：{role} · {level} · {duration} 分钟
```

例：
- `按 interview-coach skill 给我来一场模拟考：云原生 SRE · Senior · 60 分钟`

## 内部填词表

- **flow**: 系统设计 / 编码 / 行为 / 故障复盘
- **role**: 云原生 SRE / AI 智能体工程师（见 roles/ 目录）
- **level**: Junior (0-2y) / Mid (2-5y) / Senior (5y+) / Staff+ (8y+)

## 高级用法

### 多轮练

```
按 interview-coach skill：
1. 先给我来一轮编码面试（AI 工程师岗，mid）
2. 然后系统设计（云原生 SRE 岗，senior）
3. 最后给我出综合反馈
```

### 指定题库

```
按 interview-coach skill 给我出一道 system design 题，限定用 knowledge/questions/ai-engineer/senior.md 里 #5 之后的题。
```

### 加速模式

```
按 interview-coach skill 快速来一轮 5 分钟，3 个故障复盘题，每个只追问 1 层。
```
