# 题库 · AI 智能体工程师 · Beginner（0-2y）

> 基础概念 + 入门级编码题。**适合初级 AI 应用工程师**。
> 题目按"经典度 + 用户相关性"排序。

---

## 概念题（口述，必走）

### 1. 解释 LLM 的 token / context window / cost
**及格线**：
- 1 token ≈ 0.75 个英文单词 / 1-2 个中文字
- context window = input + output 总和
- 成本：input 便宜、output 贵
- 长上下文不是越大越好（latency + cost + 注意力稀释）

### 2. 解释什么是 RAG
**及格线**：
- Retrieval-Augmented Generation
- 流程：query → 检索相关文档 → 给 LLM → LLM 总结答案
- 目的：让 LLM 用最新/私有知识

### 3. 解释 Embedding 是什么
**及格线**：
- 把文本转成高维向量（d 维）
- 语义相近 → 向量距离近
- 用 cosine similarity 算相关度

### 4. 解释 Prompt / System Prompt / User Prompt
**及格线**：
- System Prompt：角色设定 + 规则（持续生效）
- User Prompt：用户当下的问题
- Assistant：模型的输出

### 5. 解释 Function Calling 流程
**及格线**：
- 用户问"北京天气怎么样？"
- LLM 识别要调用工具：`get_weather(city="北京")`
- 程序真正调 API，把结果给 LLM
- LLM 整理自然语言回复

### 6. 解释 LLM "幻觉"（hallucination）
**及格线**：
- LLM 编造不存在的内容
- 原因：训练数据噪声 + 推理时强制要给答案
- 缓解：检索 + 工具 + 强制"不知道"

---

## 编码题

### 7. 写代码统计一段文本的 token 数
**要求**：用 OpenAI tokenizer（或 tiktoken）算 token 数。

**考察点**：
- 知道 tokenizer 的存在
- 能区分中文 / 英文 / 空格

**追问**：中文 token 占比为什么偏高？

### 8. 写代码实现一个简单的 cosine similarity
**要求**：两个等长向量，算相似度。

**考察点**：
- 知道公式：cosine = (A·B) / (|A| × |B|)
- 边界：零向量

### 9. 调用 OpenAI API 完成一次对话
**要求**：
- 能正确传 model / messages / temperature
- 能处理错误
- 能 stream 输出

**考察点**：
- OpenAI Python SDK 基本用法
- 异常处理
- cost awareness

### 10. 写一个 chunking 函数：按 paragraph 切
**要求**：
- 给一段文字，返回 paragraph 列表
- 去掉空 paragraph
- 每个 paragraph < N 字符

**考察点**：
- 字符串处理
- 边界条件

---

## 排查 / 调试题

### 11. LLM 回复没引用你提供的文档，可能原因？
**考察点**：
- 文档没真正塞进 context（截断了？）
- LLM prompt 里没强制要求引用
- 文档内容跟 query 不相关

### 12. 调用 OpenAI 返回 429 怎么办？
**考察点**：
- Rate limit 重试（带 exponential backoff）
- 限流（业务层加重试 / 分散请求）
- 上限到达 → 上报 + 排队

### 13. 调用 LLM 出现 "context_length_exceeded" 怎么办？
**考察点**：
- 截断历史对话
- 用 compaction 总结
- 用 long context 模型（但成本高）

---

## 系统设计（小型）

### 14. 设计一个 console 版 GPT 对话工具
**要求**：
- 用户输入 → 调 LLM → 输出
- 保留多轮对话历史
- 流式输出（用户能看字一个字一个字打）

**考察点**：
- message 历史管理
- streaming 处理
- 异常（断网 / 超时）

### 15. 设计一个简单的文档摘要工具
**要求**：
- 上传 txt/md 文件
- 按 chunk 切（300 tokens）
- 每 chunk 单独 summarize
- 最后整篇总结

**考察点**：
- 文件 IO
- token 计数
- map-reduce 思路

---

## 知识题

### 16. 主流 LLM 模型有哪些？（说 3 家算及格）
**及格线**：OpenAI（GPT-4）/ Anthropic（Claude）/ Google（Gemini）/ 开源（Llama / Qwen）/ 国内（智谱 / 月之暗面 / Deepseek）

### 17. 主流 Embedding 模型有哪些？
**及格线**：OpenAI text-embedding / BGE / m3e / Cohere

### 18. 解释什么是 Fine-tuning
**及格线**：
- 在预训练模型上用领域数据继续训练
- 适合：风格定制 / 领域知识
- 成本：贵（GPU + 数据准备）

**追问**：和 prompt engineering 区别？

---

## 备注

- **Junior 面试重点**：基础概念 + 简单编码
- **必考一题概念题**（看知识深度）
- **必考一题编码题**（看动手能力）
- 用户答得好 → 升级到 intermediate.md

---

**维护者注**：题目按"工程师入门思路"组织。会用 API + 懂原理 = 及格。
