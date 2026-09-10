{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.funkcia.hm.gui.zen-browser;
in
{
  options.funkcia.hm.gui.zen-browser = {
    enable = lib.mkEnableOption "Zen Browser";
    isDefaultBrowser = lib.mkEnableOption "Zen Browser to be the default browser";
  };

  config = lib.mkIf (config.funkcia.hm.gui.enable && cfg.enable) {
    home.packages = with pkgs; [
      zen-browser
    ];

    funkcia.hm.xdg.mime.defaultApplications.webFormats = lib.mkIf cfg.isDefaultBrowser [
      "zen.desktop"
    ];
  };
}
