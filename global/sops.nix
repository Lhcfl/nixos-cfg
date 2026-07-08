{ config, lib, ... }:
{
  options.linca.sops.enable = lib.mkEnableOption "Enable SOPS configs" // {
    default = true;
  };

  config = lib.mkIf config.linca.sops.enable {

    sops = {
      defaultSopsFile = ../secrets/default.yaml;
      age.keyFile = "/home/linca/.config/sops/age/keys.txt";
      secrets.hello = { };

      secrets."opencode_server/username" = { };
      secrets."opencode_server/password" = { };
      templates."opencode_server_env" = {
        content = ''
          OPENCODE_SERVER_USERNAME=${config.sops.placeholder."opencode_server/username"}
          OPENCODE_SERVER_PASSWORD=${config.sops.placeholder."opencode_server/password"}
        '';
        owner = "linca";
      };

      secrets."cloudflare/start-tunnel-nixos" = {
        owner = "linca";
      };
    };

  };
}
