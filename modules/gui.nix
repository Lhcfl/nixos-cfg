{
  pkgs,
  lib,
  config,
  ...
}:
let
  cfg = config.funkcia.os.gui;
in
{
  options.funkcia.os.gui = {
    enable = lib.mkEnableOption "GUI related options";
    isWayland = lib.mkOption {
      description = "is wayland";
      types = lib.types.bool;
    };
  };

  config = lib.mkIf cfg.enable (
    lib.mkMerge [
      {
        environment.systemPackages = with pkgs; [
          ## GUI PACKAGES
          libnotify # notification support
          firefox
          xray
          brightnessctl # brightness control
          playerctl # media player control
        ];

        funkcia.os.gui.fonts.enable = lib.mkDefault true;
      }

      (lib.mkIf cfg.isWayland {
        environment.sessionVariables.NIXOS_OZONE_WL = "1";
        environment.systemPackages = with pkgs; [
          wl-clipboard-rs
        ];
      })
    ]
  );
}
