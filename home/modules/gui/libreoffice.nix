{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.funkcia.hm.gui.libreoffice;
in
{
  options.funkcia.hm.gui.libreoffice = {
    enable = lib.mkEnableOption "libre office";
  };

  config = lib.mkIf (config.funkcia.hm.gui.enable && cfg.enable) {
    home.packages = with pkgs; [
      libreoffice
    ];

    funkcia.hm.xdg.mime.defaultApplications = {
      wordFormats = [ "writer.desktop" ];
      excelFormats = [ "calc.desktop" ];
      pptFormats = [ "impress.desktop" ];
    };
  };
}
