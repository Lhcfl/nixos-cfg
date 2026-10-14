{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.linca.work;
in
{
  config = lib.mkIf (cfg.enable && config.linca.sops.enable) {
    sops.secrets."pi/web-password" = { };

    sops.templates."pi-web-env".content = ''
      PI_WEB_PASSWORD=${config.sops.placeholder."pi/web-password"}
      PI_WEB_ALLOWED_HOSTS=pi.workstation.internal
    '';

    systemd.user.services.pi-web = {
      Unit = {
        Description = "Pi Web UI（Caddy 反代到 pi.workstation.internal）";
        After = [ "network-online.target" ];
        Wants = [ "network-online.target" ];
      };

      Service = {
        WorkingDirectory = config.home.homeDirectory;
        EnvironmentFile = config.sops.templates."pi-web-env".path;

        # 用 login fish 启动，让 pi-web 及其派生的 agent 继承 linca 的完整登录环境，
        # 而不是只有 systemd user manager 那一份：
        #   - systemd user manager 自带 NixOS environment.sessionVariables（代理、
        #     XDG_*）以及包含 ~/.local/bin、bun、home-manager profile 的 PATH；
        #   - login fish 再 source ~/.config/fish/config.fish → hm-session-vars，
        #     补上 home.sessionVariables 与 home.sessionPath。
        # 所以这里不写死 PATH，避免把上面的环境裁掉。
        ExecStart = "${pkgs.fish}/bin/fish -lc 'exec pi-web --hostname 0.0.0.0'";

        Restart = "on-failure";
        RestartSec = 5;
      };

      Install.WantedBy = [ "default.target" ];
    };
  };
}
