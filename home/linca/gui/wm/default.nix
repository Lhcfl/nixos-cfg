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
    environment.QT_QPA_PLATFORM = "wayland";
    layout = {
      preset-column-widths = [
        0.33
        0.49
        0.65
        0.98
      ];
    };
  };
}
