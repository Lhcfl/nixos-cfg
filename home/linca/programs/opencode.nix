{
  osConfig,
  lib,
  pkgs,
  ...
}:
{
  # options.funkcia.hm.opencode.enable = lib.mkEnableOption "enable opencode";
  # config = lib.mkIf config.funkcia.hm.opencode.enable {
  # };

  config = lib.mkMerge [
    {
      programs.opencode = {
        enable = true;
        settings = {
          plugin = [ "superpowers@git+https://github.com/obra/superpowers.git" ];
        };
        tui = {
          theme = "system";
        };
        web.enable = true;
      };
    }
    (lib.mkIf osConfig.linca.sops.enable (
      let
        env_path = osConfig.sops.templates."opencode_server_env".path;
      in
      {
        programs.opencode.web.environmentFile = env_path;
        home.packages = [
          (pkgs.writeShellApplication {
            name = "opencode-attach";
            runtimeInputs = with pkgs; [
              dotenv-cli
            ];
            text = ''
              dotenv -e ${env_path} -- opencode attach "http://localhost:4096"
            '';
          })
        ];
      }
    ))
  ];
}
