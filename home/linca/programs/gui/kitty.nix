{ lib, ... }: {
  programs.kitty = {
    enable = true;
    font = {
      name = "Maple Mono NF CN";
      size = 10.5;
    };
    extraConfig = ''
      map ctrl+c copy_and_clear_or_interrupt
      map shift+enter send_text all \e\r
    '';
    settings = {
      window_padding_width = 2;
      cursor_trail = 1;
      background_opacity = lib.mkDefault 0.8;
    };
  };
}
