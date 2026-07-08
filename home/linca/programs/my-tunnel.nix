{
  osConfig,
  lib,
  ...
}:
{
  config = lib.mkIf osConfig.linca.sops.enable {
    home.file.".local/bin/start-cloudflare-tunnel.sh" = {
      text = "cat ${osConfig.sops.secrets."cloudflare/start-tunnel-nixos".path} | bash";
      executable = true;
    };
  };
}
