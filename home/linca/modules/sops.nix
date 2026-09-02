{
  config,
  lib,
  osConfig,
  ...
}:
{
  options.linca.sops.enable = lib.mkEnableOption "SOPS configs";

  config.linca.sops.enable = lib.mkDefault (!osConfig.funkcia.os.new-cn-install);

  config.sops = lib.mkIf (osConfig.funkcia.os.sops-support.enable && config.linca.sops.enable) {
    defaultSopsFile = ./secrets.yaml;
    age.keyFile = "/home/linca/.config/sops/age/keys.txt";

    secrets = {
      "opencode_server/username" = { };
      "opencode_server/password" = { };
      "cloudflare/start-tunnel-nixos" = { };
    };
  };
}
