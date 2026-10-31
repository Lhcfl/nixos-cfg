{
  pkgs,
  lib,
  config,
  ...
}:
let
  cfg = config.funkcia.os.DE;
in
{
  options.funkcia.os.DE = {
    enable = lib.mkEnableOption "GUI related options";

    isWayland = lib.mkOption {
      description = "is wayland";
      type = lib.types.bool;
    };
  };

  config = lib.mkIf cfg.enable (
    lib.mkMerge [
      {
        funkcia.os.DE = {
          settings.extra-fonts.enable = lib.mkDefault true;
        };

        environment.systemPackages = with pkgs; [
          ## GUI PACKAGES
          libnotify # notification support
          firefox
          xray
          brightnessctl # brightness control
          playerctl # media player control
        ];
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
