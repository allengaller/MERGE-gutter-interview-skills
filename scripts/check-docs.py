#!/usr/bin/env python3
"""文档一致性校验：链接可达性 + 基础 markdown lint + 声明的不变量。

仅用标准库，`python3 scripts/check-docs.py` 即可运行。
"""

import os
import re
import subprocess
import sys

REPO = os.path.dirname(os.path.abspath(__file__)).removesuffix("/scripts")
EXCLUDE_DIRS = ("archive/", ".git/", "node_modules/")

# 文档里写相对路径时用到的几个隐含基准目录，按优先级尝试。
# 本仓库的散文引用普遍用「简写」：`流程/x.md`、`卡/x.md`、`AI-SA/x.md` 都省略了
# 所属 skill 目录或 知识库/题库/ 前缀，所以这些前缀目录必须进候选基准。
EXTRA_ROOTS = (
    "知识库",
    os.path.join("知识库", "题库"),
    os.path.join(".claude", "skills"),
)
DOC_EXTS = ("md", "py", "sh", "json", "yaml", "yml", "ts", "js", "csv", "txt")

# 含占位符、glob、命令片段、CSS 片段的反引号内容不做存在性校验
SKIP_BACKTICK = re.compile(r"[<>*|~$\\ :]|^\.\./\.\./\.\./|\.(com|cn|org|io|dev)\b")
FENCE = re.compile(r"^\s{0,3}(```+|~~~+)")
MD_LINK = re.compile(r"\[[^\]]*\]\(([^)\s]+)")
BACKTICK = re.compile(r"`([^`\n]+)`")
HEADING = re.compile(r"^(#{1,6})\s+(.*)$")
# 反引号里的 `owner/name`（GitHub 仓库、组织名）不是仓库内路径。
# 只匹配 ASCII：Python 的 \w 含中文，写成 \w 会把 `角色卡/x.md` 这类
# 单斜杠中文路径全部误判成外部仓库，而这正是本仓库最常见的引用形态。
GH_REPO = re.compile(r"^[A-Za-z0-9._-]+/[A-Za-z0-9._-]+$")
# 指向 oh-my-career / v1 站点仓的历史引用，本仓库内不存在属正常
EXTERNAL_PREFIX = ("docs/", "knowledge/")
# 更新日志记录的是改名前的历史状态，不做路径存在性校验
HISTORICAL = ("更新日志.md",)


def tracked_markdown():
    out = subprocess.run(
        ["git", "-C", REPO, "ls-files", "-z", "*.md"],
        capture_output=True, check=True,
    ).stdout.split(b"\0")
    return sorted(
        p.decode() for p in out
        if p and not p.decode().startswith(EXCLUDE_DIRS)
    )


def skill_roots():
    """仓库内所有 skill 根目录（含 SKILL.md 的目录）。

    根 README 与 知识库 里的文档习惯直接写 skill 内的简写路径（`流程/快问快答.md`、
    `角色卡/_模板.md`），不带上 `../../.claude/skills/<skill>/` 前缀。
    """
    if "_cache" in skill_roots.__dict__:
        return skill_roots._cache
    found = []
    for base, dirs, files in os.walk(REPO):
        dirs[:] = [
            d for d in dirs
            if not os.path.join(os.path.relpath(base, REPO), d).startswith(EXCLUDE_DIRS)
            and d not in (".git", "node_modules")
        ]
        if "SKILL.md" in files:
            found.append(base)
    skill_roots._cache = found
    return found


def roots_for(rel):
    """文档中相对路径可能的基准目录，按解析优先级排列。"""
    path = os.path.join(REPO, rel)
    found = [os.path.dirname(path)]

    # 最近的含 SKILL.md 的祖先目录（skill 内文档以 skill 根为基准）
    d = os.path.dirname(path)
    while len(d) > len(REPO):
        if os.path.isfile(os.path.join(d, "SKILL.md")):
            found.append(d)
            break
        parent = os.path.dirname(d)
        if parent == d:
            break
        d = parent

    found.append(REPO)
    found.extend(skill_roots())
    for extra in EXTRA_ROOTS:
        found.append(os.path.join(REPO, extra))
    return found


def resolve(cand, roots):
    """把文档里写的相对路径解析到磁盘；返回 None 表示找不到。"""
    for root in roots:
        path = os.path.normpath(os.path.join(root, cand))
        if path != REPO and not path.startswith(REPO + os.sep):
            continue  # 拒绝越界到仓库外
        if os.path.exists(path):
            return path
    return None


def is_path_claim(cand):
    """判断反引号内容是否意图指向仓库内的一个路径。"""
    if not cand or cand.startswith(("http://", "https://", "~", "/")):
        return False
    if GH_REPO.match(cand):
        return False  # kudig-io/etcd-guardian 之类的外部仓库标识
    if "/" not in cand:
        return False  # 裸文件名多是泛指，不是路径声明
    exts = "|".join(DOC_EXTS)
    return cand.endswith("/") or bool(re.search(rf"\.({exts})$", cand))


def is_soft_claim(cand):
    """跨仓历史引用与"兄弟 skill 内部布局"泛指降级为警告：本仓库内解析不到属正常。

    多段目录（两个斜杠以上，如 `k8s-ops-quick-qa/卡/`）描述的是另一个 skill 的文件树，
    不该拿本仓库的路径解析去判它。单段 `角色卡/` 这类本仓库自己的目录不在豁免内：
    解析不到就说明目录被改名了，正是该报警的情况。
    """
    return cand.startswith(EXTERNAL_PREFIX) or (
        cand.endswith("/") and cand.count("/") > 1
    )


def slugify(text):
    """近似 GitHub 的标题锚点规则。"""
    s = text.strip().lower()
    s = re.sub(r"[^\w\- \u4e00-\u9fff]", "", s)
    return re.sub(r" ", "-", s)


def iter_lines(text):
    """产出 (行号, 内容, 是否在代码围栏内)。"""
    fence = None
    for i, line in enumerate(text.splitlines(), 1):
        m = FENCE.match(line)
        if m:
            marker = m.group(1)[0] * 3
            if fence is None:
                fence = marker
                yield i, line, True
                continue
            if line.strip().startswith(fence):
                fence = None
                yield i, line, True
                continue
        yield i, line, fence is not None
    if fence is not None:
        yield -1, "", False


def check():
    errors, warnings = [], []
    all_slugs = {}

    for rel in tracked_markdown():
        path = os.path.join(REPO, rel)
        with open(path, encoding="utf-8") as f:
            text = f.read()
        roots = roots_for(rel)
        skip_paths = rel in HISTORICAL
        slugs, prev_level, open_fence = set(), 0, None

        for lineno, line, in_fence in iter_lines(text):
            if lineno == -1:
                errors.append(f"{rel}: 代码围栏未闭合（{open_fence} 起）")
                continue

            if in_fence:
                continue

            if line.rstrip() != line and line.strip():
                warnings.append(f"{rel}:{lineno}: 行尾多余空格")

            hm = HEADING.match(line)
            if hm:
                level, title = len(hm.group(1)), hm.group(2).strip()
                if prev_level and level > prev_level + 1:
                    warnings.append(
                        f"{rel}:{lineno}: 标题层级跳跃 H{prev_level} → H{level}"
                    )
                prev_level = level
                slugs.add(slugify(title))
                continue

            for target in MD_LINK.findall(line):
                if target.startswith(("http://", "https://", "mailto:", "#")):
                    continue
                file_part, _, anchor = target.partition("#")
                if not file_part:
                    if anchor and slugify(anchor) not in slugs:
                        errors.append(f"{rel}:{lineno}: 页内锚点不存在 #{anchor}")
                    continue
                found = resolve(file_part, roots)
                if found is None:
                    errors.append(f"{rel}:{lineno}: 链接目标不存在 {file_part}")
                elif anchor:
                    key = os.path.relpath(found, REPO)
                    if key in all_slugs and slugify(anchor) not in all_slugs[key]:
                        errors.append(f"{rel}:{lineno}: 锚点不存在 {target}")

            for cand in BACKTICK.findall(line):
                cand = cand.strip()
                if SKIP_BACKTICK.search(cand) or not is_path_claim(cand):
                    continue
                if skip_paths:
                    continue
                if resolve(cand, roots) is None:
                    msg = f"{rel}:{lineno}: 引用的路径不存在 `{cand}`"
                    (warnings if is_soft_claim(cand) else errors).append(msg)

        if text and not text.lstrip().startswith(("#", "---")):
            warnings.append(f"{rel}: 缺少一级标题")
        all_slugs[rel] = slugs

    check_shared_numbers(errors)
    check_copies(errors)
    return errors, warnings


def check_copies(errors):
    """`xxx 2.md` 形式的副本是复制/同步产生的意外文件，不是内容。"""
    out = subprocess.run(
        ["git", "-C", REPO, "ls-files", "-z"], capture_output=True, check=True
    ).stdout.split(b"\0")
    for p in sorted(x.decode() for x in out if x):
        if p.startswith(EXCLUDE_DIRS):
            continue
        if re.search(r" \d+\.(md|png|jpg|pdf|txt)$", p):
            errors.append(f"疑似意外副本：{p}")


def section(text, num):
    """取出 `## <num>.` 开头到下一个 `## ` 之间的正文。"""
    lines = text.splitlines()
    start = None
    for i, line in enumerate(lines):
        if start is None:
            if re.match(rf"^##\s+{re.escape(num)}\.", line):
                start = i
        elif re.match(r"^##\s", line):
            return "\n".join(lines[start:i]).strip()
    return "\n".join(lines[start:]).strip() if start is not None else None


def check_shared_numbers(errors):
    """README 声称两页 卡/数字弹药.md 的 §8 逐字相同。"""
    pair = [
        ".claude/skills/k8s-ops-quick-qa/卡/数字弹药.md",
        ".claude/skills/llm-ops-quick-qa/卡/数字弹药.md",
    ]
    blocks = []
    for rel in pair:
        path = os.path.join(REPO, rel)
        if not os.path.isfile(path):
            errors.append(f"缺少 {rel}（README 声明两页 §8 同源）")
            return
        with open(path, encoding="utf-8") as f:
            body = section(f.read(), "8")
        if body is None:
            errors.append(f"{rel}: 找不到 §8 小节")
            return
        blocks.append(body)

    if blocks[0] != blocks[1]:
        import difflib

        diff = "\n".join(
            f"  {l}" for l in difflib.unified_diff(
                blocks[0].splitlines(), blocks[1].splitlines(),
                "k8s §8", "llm §8", lineterm="", n=1,
            )
        )
        errors.append(
            "README 声明「§8 项目数字两页逐字相同」，实际不一致：\n" + diff
        )


def main():
    strict = "--strict" in sys.argv
    quiet = "--quiet" in sys.argv
    errors, warnings = check()

    if not quiet:
        for w in warnings:
            print(f"WARN  {w}")
    for e in errors:
        print(f"ERROR {e}")

    print(
        f"\n{len(tracked_markdown())} 个文档 · "
        f"{len(errors)} 个错误 · {len(warnings)} 个警告"
    )
    if errors or (strict and warnings):
        return 1
    return 0


if __name__ == "__main__":
    sys.exit(main())
