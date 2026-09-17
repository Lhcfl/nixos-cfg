# pi 的 JSON 事件流：一边实时渲染状态和文本，一边把 assistant 消息收集起来，
# 供最后取出 commit message。
#
# nushell 有个 upstream bug：当 stdout 是「宽度为 0 的 tty」时，在流式闭包里调用
# print 会无界分配内存（约 1GB/s，直到 OOM）。这种情形下关掉实时渲染兜底；
# 其余情况（普通终端、管道）照常流式输出。
let can_stream = not ((is-terminal --stdout) and (term size).columns == 0)

let emit = {|text|
    if $can_stream { print -n $text }
}

def gen_prompt [extra: string] {
    if (git rev-parse --is-inside-work-tree | complete).exit_code != 0 {
        print --stderr "commit: 当前目录不是 git 仓库"
        exit 1
    }

    if (git status --short | complete | get stdout | str trim) == "" {
        print "commit: 没有需要提交的更改"
        exit 0
    }

    if (git diff --cached --quiet | complete).exit_code == 0 {
        print "commit: 暂存区为空，将提交全部改动"
        git add -A
    }

    let status = git status --short | complete | get stdout
    mut diff = git diff --cached | complete | get stdout

    if ($diff | str length) > 10000 {
        $diff = "(diff太长，请自行调用工具选择性查看)"
    }

    let extra_hint = if ($extra | is-empty) {
        ""
    } else {
        $"额外提示（用户要求，请优先考虑）：($extra)"
    }

    let prompt = ([
        '你是 git commit message 生成器。请根据下面的 git 仓库状态，生成一条 commit message。

规则：
- 如果上下文（AGENTS.md 等）已经给出了 commit message 风格，直接遵循，不要再去找文件
- 否则使用 Conventional Commits 格式，并在最前面加一个与改动最贴切的 emoji
- 只输出 commit message 本身，不要输出任何解释、前后缀或 Markdown 代码块
- subject 的语言与改动内容保持一致
- subject 不超过 72 个字符；确有需要时，空一行后补充正文
- 只有当 status/diff 不足以判断改动意图时，才用只读工具查看当前仓库内的文件；
- 如果有部分文件被 git add, 部分 untracked，不要关注 untracked 的文件
  不要在仓库外搜索，diff 已经足够清楚时不要调用工具'
        ""
        $extra_hint
        ""
        "git status:"
        $status
        ""
        "git diff:"
        $diff
    ] | str join "\n")
}

def handle_event [event] {
    match $event.type {
        "message_update" => {
            let delta = $event.assistantMessageEvent
            match $delta.type {
                "text_delta" => { do $emit $delta.delta }
                "thinking_delta" => { do $emit $delta.delta }
                "thinking_start" => { do $emit "\n🧠 " }
                _ => { }
            }
            null
        }
        "tool_execution_start" => {
            let arg = (
                $event.args.path?
                | default (
                    $event.args.file_path?
                    | default ($event.args.pattern? | default "")
                )
            )
            do $emit $"\n🔧 ($event.toolName) ($arg)\n"
            null
        }
        "tool_execution_end" => {
            do $emit $"(if $event.isError { '❌' } else { '✅' }) ($event.toolName)\n"
            null
        }
        "compaction_start" => {
            do $emit "\n🗜  压缩上下文…\n"
            null
        }
        "auto_retry_start" => {
            do $emit $"\n🔁 重试 ($event.attempt)/($event.maxAttempts)…\n"
            null
        }
        "message_end" => {
            if ($event.message.role? | default "") == "assistant" {
                $event.message
            } else {
                null
            }
        }
        _ => null
    }
}

export def main [...extra: string] {
    let assistant = (
        gen_prompt ($extra | str join " ")
        | ^pi --mode json --no-session --no-skills --tools read,grep,find,ls
        | lines
        | each {|line|
            let event = try { $line | from json } catch { null }
            if $event == null {
                null
            } else {
                handle_event event
            }
        }
        | where {|message| $message != null }
    )

    let last_message = (
        if ($assistant | is-empty) { null } else {
            $assistant | last
        }
    )

    if $last_message != null and (($last_message.stopReason? | default "") == "error") {
        print --stderr $"\ncommit: agent 出错：($last_message.errorMessage? | default '未知错误')"
        exit 1
    }

    let texts = (
        $assistant
        | each {|message|
            $message.content
            | where {|block| ($block.type? | default "") == "text" }
            | each {|block| $block.text }
            | str join "\n"
        }
        | where {|text| ($text | str trim) != "" }
    )

    if ($texts | is-empty) {
        print --stderr "\ncommit: 无法生成 commit message"
        exit 1
    }

    let message = (
        ($texts | last)
        | lines
        | where {|line| not ($line | str trim | str starts-with '```') }
        | str join "\n"
        | str trim
    )

    if $message == "" {
        print --stderr "\ncommit: 无法生成 commit message"
        exit 1
    }

    print $"\n($message)\n"
    git commit -m $message
}
