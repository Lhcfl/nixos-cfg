{ config, ... }:
{
  funkcia.hm.gui.vicinae = {
    enable = config.funkcia.hm.gui.enable;

    settings = {
      launcher_window.opacity = 0.8;
    };
  };
}
