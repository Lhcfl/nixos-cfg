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
      xray
      brightnessctl # brightness control
      playerctl # media player control
    ];
  };
}
