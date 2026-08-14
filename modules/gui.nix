{
  pkgs,
  lib,
  config,
  ...
}:
{
  options.funkcia.os.gui = {
    enable = lib.mkEnableOption "GUI related options";
  };

  config = lib.mkIf config.funkcia.os.gui.enable {
    environment.systemPackages = with pkgs; [

      ## GUI PACKAGES
      libnotify # notification support
      firefox
      v2rayn # proxy client
      xray # proxy client
      brightnessctl # brightness control
      playerctl # media player control
    ];
  };
}
