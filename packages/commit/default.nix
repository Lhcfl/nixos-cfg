{ ... }:
let
  name = "commit";
in
{
  perSystem = { pkgs, config, ... }: {
    packages.${name} = (pkgs.writeShellApplication {
      name = name;
      runtimeInputs = with pkgs; [
        git
        pi-coding-agent
      ];
      text = ''
        if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
          echo "commit: 当前目录不是 git 仓库" >&2
          exit 1
        fi

        if [ -z "$(git status --short)" ]; then
          echo "commit: 没有需要提交的更改"
          exit 0
        fi

        if git diff --cached --quiet; then
          echo "commit: 暂存区为空，将提交全部改动"
          git add -A
        fi

        status="$(git status --short)"
        diff="$(git diff --cached)"

        prompt="你是 git commit message 生成器。请根据下面的 git 仓库状态，生成一条 commit message。

        规则：
        - 使用 gitmoji 风格：commit message 最前面是一个与改动最贴切的 emoji，空一格后接 Conventional Commits 格式的 type(scope): subject
        - 只输出 commit message 本身，不要输出任何解释、前后缀或 Markdown 代码块
        - subject 的语言与改动内容保持一致
        - subject 不超过 72 个字符；确有需要时，空一行后补充正文

        git status:
        $status

        git diff:
        $diff"

        message="$(printf '%s\n' "$prompt" | pi -p --no-session --no-tools --no-context-files --no-skills)"
        message="$(printf '%s\n' "$message" | sed -e '/^```/d' -e '/./,$!d')"

        if [ -z "$message" ]; then
          echo "commit: 无法生成 commit message" >&2
          exit 1
        fi

        printf '\n%s\n\n' "$message"
        git commit -m "$message" "$@"
      '';
    }).overrideAttrs (old: {
      meta = old.meta // {
        description = "根据当前 git 仓库状态用 pi 生成 commit message 并提交";
      };
    });
    overlayAttrs.${name} = config.packages.${name};
  };
}
