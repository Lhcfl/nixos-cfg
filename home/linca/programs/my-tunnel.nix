{
  config,
  lib,
  pkgs,
  ...
}:
{
  config = lib.mkIf config.linca.sops.enable {
    sops.secrets."cloudflare/start-tunnel-nixos" = { };

    home.packages = [
      (pkgs.writeShellApplication {
        name = "start-cloudflare-tunnel";
        runtimeInputs = with pkgs; [
          dotenv-cli
        ];
        text = ''
          cat ${config.sops.secrets."cloudflare/start-tunnel-nixos".path} | bash
        '';
      })
    ];
  };
}
