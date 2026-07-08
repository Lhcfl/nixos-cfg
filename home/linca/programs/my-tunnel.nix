{
  osConfig,
  lib,
  pkgs,
  ...
}:
{
  config = lib.mkIf osConfig.linca.sops.enable {
    home.packages = [
      (pkgs.writeShellApplication {
        name = "start-cloudflare-tunnel";
        runtimeInputs = with pkgs; [
          dotenv-cli
        ];
        text = ''
          cat ${osConfig.sops.secrets."cloudflare/start-tunnel-nixos".path} | bash
        '';
      })
    ];
  };
}
