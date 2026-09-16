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
      scrolling.history = 100000;
      selection.save_to_clipboard = true;
    };
  };
}
