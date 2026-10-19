{
  pkgs,
  config,
  lib,
  ...
}:
let
  cfg = config.funkcia.hm.programs.dsh;
in
{
  options.funkcia.hm.programs.dsh = {
    enable = lib.mkEnableOption "DeepSeek Harness（dsh）的 package";

    systemd.enable = lib.mkEnableOption "systemd service for dsh-web";

    environmentFiles = lib.mkOption {
      type = lib.types.listOf (
        lib.types.oneOf [
          lib.types.str
          lib.types.path
        ]
      );
      default = [ ];
      example = lib.literalExpression ''
        [ config.sops.templates."dsh-env".path ]
      '';
      description = ''
        systemd `EnvironmentFile` 列表，每行 `KEY=VALUE`。适合放 sops 模板等不宜
        进 Nix store 的机密。
      '';
    };

    extraArgs = lib.mkOption {
      type = lib.types.listOf lib.types.str;
      default = [ ];
      example = lib.literalExpression ''
        [ "--port" "8080" ]
      '';
      description = "追加到 `dsh web --no-open` 之后的启动参数，例如 `--host`、`--port`。";
    };
  };

  config = lib.mkIf cfg.enable (
    lib.mkMerge [
      {
        # DeepSeek Harness。
        # nixpkgs 编译的 node 带硬化，导致 `node-addon-require-builtin` 反汇编
        # V8 getter 失败。使用 llm-agents 这个 flake 有现成的修复。
        # 见 https://github.com/numtide/llm-agents.nix/issues/9994
        home.packages = [ pkgs.llm-agents.dsh ];
      }

      (lib.mkIf cfg.systemd.enable (
        let
          # 启动脚本：extraArgs 交给 sh 做词法拆分，而不是塞进 ExecStart 里让 systemd
          # 和 fish -lc 各解析一遍引号。
          start = pkgs.writeShellScript "dsh-web-start" ''
            exec ${pkgs.llm-agents.dsh}/bin/dsh web --no-open ${lib.escapeShellArgs cfg.extraArgs}
          '';

          chromium-app = pkgs.writeShellApplication {
            name = "dsh-web";
            text = /* sh */ ''
              DIR=''${XDG_DATA_HOME:-"$HOME/.local/share"}

              journalctl --user -u dsh-web.service -n 100 --no-pager \
              | awk '/dsh web: http/{u=$NF} END{print "--app=" u}' \
              | xargs -r chromium --user-data-dir="$DIR/dsh-web" --profile-directory="dsh"
            '';
          };

          desktop-entry = pkgs.makeDesktopItem {
            name = "deepseek-harness"; # 文件名（不含 .desktop）
            startupWMClass = "chrome-127.0.0.1__-dsh";
            desktopName = "Deepseek Harness"; # 显示名称
            exec = lib.getExe chromium-app;
            icon = ./dsh-icon.svg; # 图标名称（需在图标主题中能找到）
            comment = "Agent for work with documents, analyze spreadsheets, write code, and schedule tasks.";
            categories = [
              "X-Agent"
              "Utility"
            ]; # 应用类别
            terminal = false; # 是否在终端中运行
            keywords = [
              "app"
              "agent"
              "coding"
              "deepseek"
              "harness"
            ]; # 搜索关键词
          };
        in
        {
          home.packages = [
            chromium-app
            desktop-entry
          ];

          # 用 login fish 启动，让 dsh 及其派生的 agent shell 继承 linca 的完整登录
          # 环境（home-manager 的 sessionVariables/sessionPath 等），与 pi-web 一致。
          #
          # 不做 socket activation：dsh web 的 HTTP listener 由 dsh-host-webserver 自己
          # `listen(host, port)`，不读 LISTEN_FDS、也不发 sd_notify，systemd 持有的
          # socket 没法交给它；要按需拉起只能上 systemd-socket-proxyd 中转。
          systemd.user.services.dsh-web = lib.mkIf cfg.systemd.enable {
            Unit = {
              Description = "DeepSeek Harness Web GUI";
            };

            Service = {
              WorkingDirectory = config.home.homeDirectory;
              ExecStart = "${pkgs.fish}/bin/fish -lc 'exec ${start}'";
              EnvironmentFile = cfg.environmentFiles;

              Restart = "on-failure";
              RestartSec = 5;
            };

            Install.WantedBy = [ "default.target" ];
          };
        }
      ))
    ]
  );
}
