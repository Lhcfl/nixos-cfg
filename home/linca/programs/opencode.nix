{ osConfig, ... }:
{
  # options.funkcia.hm.opencode.enable = lib.mkEnableOption "enable opencode";
  # config = lib.mkIf config.funkcia.hm.opencode.enable {
  # };

  programs.opencode = {
    enable = true;
    settings = {
      plugin = [ "superpowers@git+https://github.com/obra/superpowers.git" ];
    };
    tui = {
      theme = "system";
    };
    web.enable = true;
    web.environmentFile = osConfig.sops.templates."opencode_server_env".path;
  };
}
