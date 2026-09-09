{ ... }:
let
  myTipsDir = "/home/linca/linca/my-tips";
in
{
  # 交互式 fish 启动时的 greeting：
  #   - 保留 fish 默认的欢迎信息；
  #   - 若 ${myTipsDir}/tip.md 存在，则用 bun 渲染一次，输出追加到 greeting，
  #     然后调用 `bun src/index.ts --done` 把它归档（即只显示一次）。
  # 仅交互式 shell 会调用 fish_greeting，所以非交互场景不受影响。
  programs.fish.functions.fish_greeting = ''
    # fish 默认 greeting（与内置 fish_greeting 行为一致）
    if not set -q fish_greeting
        set -l line1 (_ 'Welcome to fish, the friendly interactive shell')
        set -l line2 \n(printf (_ 'Type %shelp%s for instructions on how to use fish') (set_color green) (set_color --reset))
        set -g fish_greeting "$line1$line2"
    end

    if set -q fish_private_mode && set -q fish_greeting[1]
        set -l line (_ "fish is running in private mode, history will not be persisted.")
        set -g fish_greeting $fish_greeting\n$line
    end

    test -n "$fish_greeting"; and echo $fish_greeting

    # 追加 my-tips 的 tip
    test -f ${myTipsDir}/tip.md; or return

    # 用 env -C 指定工作目录，避免在 greeting 里 cd 影响当前 shell
    set -l rendered (command env -C ${myTipsDir} bun src/index.ts --render 2>/dev/null | string collect)
    command env -C ${myTipsDir} bun src/index.ts --done >/dev/null 2>&1

    if test -n "$rendered"
        echo
        echo $rendered
    end
  '';
}
