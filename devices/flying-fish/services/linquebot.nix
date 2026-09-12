{
  config,
  inputs,
  lib,
  pkgs,
  ...
}:
let
  system = pkgs.stdenv.hostPlatform.system;
  linquebot = inputs.linquebot_rs.packages.${system}.linquebot_rs;
in
{
  sops.secrets."linquebot/teloxide-token" = { };

  sops.templates."linquebot-env" = {
    content = ''
      TELOXIDE_TOKEN=${config.sops.placeholder."linquebot/teloxide-token"}
      DATABASE_PATH=/var/lib/linquebot/data.db
      AI_API_URL="https://api.deepseek.com/chat/completions"
      AI_API_MODEL="deepseek-flash"
    '';
    owner = "linquebot";
    restartUnits = [ "linquebot.service" ];
  };

  users.groups.linquebot = { };
  users.users.linquebot = {
    isSystemUser = true;
    group = "linquebot";
    home = "/var/lib/linquebot";
  };

  systemd.services.linquebot = {
    description = "Linquebot RS (Telegram bot)";
    documentation = [ "https://github.com/Lhcfl/Linquebot_rs" ];

    after = [ "network-online.target" ];
    wants = [ "network-online.target" ];
    wantedBy = [ "multi-user.target" ];

    serviceConfig = {
      User = "linquebot";
      Group = "linquebot";
      WorkingDirectory = "/var/lib/linquebot";
      StateDirectory = "linquebot";
      Environment = [
        "HOME=/var/lib/linquebot"
        "RUST_LOG=info"
      ];
      EnvironmentFile = config.sops.templates."linquebot-env".path;
      ExecStart = lib.getExe linquebot;
      Restart = "on-failure";
      RestartSec = 5;
    };
  };
}
