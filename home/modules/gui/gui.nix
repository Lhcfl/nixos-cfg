{
  lib,
  osConfig,
  ...
}:
{
  options.funkcia.hm.gui = {
    enable = lib.mkEnableOption "GUI packages" // {
      default = osConfig.funkcia.os.gui.enable or false;
      defaultText = lib.literalExpression "osConfig.funkcia.os.gui.enable or false";
    };
  };
}
