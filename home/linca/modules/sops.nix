{
  config,
  lib,
  osConfig,
  ...
}:
{
  options.linca.sops.enable = lib.mkEnableOption "SOPS configs" // {
    default = true;
  };

  config = lib.mkIf (osConfig.funkcia.os.sops-support.enable && config.linca.sops.enable) {

    sops = {
      defaultSopsFile = ./secrets.yaml;
      age.keyFile = "/home/linca/.config/sops/age/keys.txt";

      secrets = {
        "opencode_server/username" = { };
        "opencode_server/password" = { };
        "cloudflare/start-tunnel-nixos" = { };
      };
    };
  };
}
