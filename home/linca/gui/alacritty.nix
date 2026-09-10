{ lib, config, ... }: {
  programs.alacritty = {
    enable = config.funkcia.hm.gui.enable;
    settings = {
      font.normal.family = "Maple Mono NF CN";
      window.padding = {
        x = 5;
        y = 5;
      };
      window.blur = true;
      window.opacity = lib.mkDefault 0.8;
    };
  };
}
