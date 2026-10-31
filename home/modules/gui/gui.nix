{
  lib,
  osConfig,
  config,
  ...
}:
let
  cfg = config.funkcia.hm.gui;
in
{
  options.funkcia.hm.gui = {
    enable = lib.mkEnableOption "GUI packages" // {
      default = osConfig.funkcia.os.DE.enable or false;
      defaultText = lib.literalExpression "osConfig.funkcia.os.DE.enable or false";
    };
  };

  config = lib.mkIf cfg.enable {
    home.pointerCursor = {
      enable = config.funkcia.hm.gui.enable;
      hyprcursor.enable = true;
      gtk.enable = true;
      x11.enable = true;
      size = lib.mkDefault 24;
    };
  };
}
