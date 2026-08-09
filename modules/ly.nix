{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.funkcia.os.ly = {
    enable = lib.mkEnableOption "ly module, which is a TUI login manager (or display manager).";
  };

  config = lib.mkIf config.funkcia.os.ly.enable {
    services.displayManager.ly = {
      settings = {
        animation = "dur_file";
        # 一个 ASCII 黑洞画画
        dur_file_path = toString (
          pkgs.fetchurl {
            url = "https://codeberg.org/attachments/f336d6ac-8331-4323-91fc-0e4619803401";
            hash = "sha256-fRm0wlkq9/GdLrVBOzMEnQG/i2ng+uGIzq0u9hu3m9g=";
          }
        );
        full_color = true;
      };
      enable = true;
    };

  };
}
