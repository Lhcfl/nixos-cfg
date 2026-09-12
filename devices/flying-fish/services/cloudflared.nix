{
  pkgs,
  lib,
  config,
  ...
}:
{
  sops.secrets."cloudflare/tunnel-token" = { };
  sops.templates."cloudflare-tunnel-connect" = {
    content = ''
      ${lib.getExe pkgs.cloudflared} tunnel run --token ${
        config.sops.placeholder."cloudflare/tunnel-token"
      }
    '';
    owner = "cloudflared";
    restartUnits = [ "cloudflared-tunnel.service" ];
  };

  users.groups.cloudflared = { };
  users.users.cloudflared = {
    isSystemUser = true;
    group = "cloudflared";
  };

  systemd.services.cloudflared-tunnel = {
    description = "Cloudflare Tunnel (token)";

    after = [ "network-online.target" ];
    wants = [ "network-online.target" ];
    wantedBy = [ "multi-user.target" ];

    serviceConfig = {
      User = "cloudflared";
      Group = "cloudflared";
      ExecStart = "${pkgs.bash}/bin/sh ${config.sops.templates."cloudflare-tunnel-connect".path}";
      Restart = "on-failure";
      RestartSec = 5;
    };
  };

  environment.systemPackages = with pkgs; [ cloudflared ];
  services.cloudflared.enable = true;
}
