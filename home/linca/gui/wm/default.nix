{
  lib,
  config,
  ...
}:
{
  funkcia.hm.gui.wm = lib.mkIf config.funkcia.hm.gui.enable {
    input = {
      follow-mouse = true;
      follow-mouse-max-scroll = 0.5;
    };
  };
}
