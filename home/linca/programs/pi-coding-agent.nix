{
  config,
  lib,
  pkgs,
  ...
}:
{
  config = lib.mkIf (config.linca.work.enable) (
    lib.mkMerge [
      {
        home.packages = [
          (pkgs.writeShellApplication {
            name = "commit";
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
              - 使用 Conventional Commits 格式，即 type(scope): subject
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
          })
        ];

        funkcia.hm.programs.pi = {
          enable = true;
          settings.packages = [
            "pi-skills"
            "npm:@xynogen/pix-sudo"
            "npm:@monopi/extension-shell-format"
            "npm:pi-agent-browser-native"
            "npm:pi-background-tasks@latest"
            "npm:@pi-unipi/notify"
            "npm:@agnishc/edb-session-manager"
            "npm:pi-interactive-shell"
          ];
        };
      }

      (lib.mkIf (config.linca.sops.enable) {
        sops.secrets.deepseek-api-key = { };
        sops.secrets.zai-cn-api-key = { };

        funkcia.hm.programs.pi.auth = {
          deepseek = {
            type = "api_key";
            key-path = config.sops.secrets."deepseek-api-key".path;
          };
          zai-coding-cn = {
            type = "api_key";
            key-path = config.sops.secrets."zai-cn-api-key".path;
          };
        };
      })
    ]
  );
}
