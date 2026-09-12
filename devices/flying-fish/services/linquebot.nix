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
  enable = true;
in
{
  nix.settings = {
    substituters = [
      "https://nix-community.cachix.org"
      "https://beiyanyunyi.cachix.org"
    ];
    trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "beiyanyunyi.cachix.org-1:iCC1rwPPRGilc/0OS7Im2mP6karfpptTCnqn9sPtwls="
    ];
  };

  sops.secrets."linquebot/teloxide-token" = { };

  sops.templates."linquebot-env" = {
    content = ''
      TELOXIDE_TOKEN=${config.sops.placeholder."linquebot/teloxide-token"}
      DATABASE_PATH=/var/lib/linquebot/data.db
      AI_API_URL="https://api.deepseek.com/chat/completions"
      AI_API_MODEL="deepseek-flash"
      AI_API_KEY=${config.sops.placeholder."linquebot/deepseek-token"}
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

  systemd.services.linquebot = lib.mkIf enable {
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
