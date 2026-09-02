{
  inputs,
  config,
  lib,
  pkgs,
  ...
}:
let
  kdl = inputs.nix-kdl.kdl;
  cfg = config.funkcia.os.gui.niri;
in
{
  options.funkcia.os.gui.niri = {
    enable = lib.mkEnableOption "niri, a Wayland WM";

    noctalia.enable =
      lib.mkEnableOption "noctalia shell, a sleek, customizable desktop shell crafted for Wayland"
      // {
        default = true;
      };

    recommandSettings = lib.mkOption {
      type = lib.types.lines;
      default = [ ];
      description = ''
        funkcia: Recommanded settings for niri module.
      '';
    };
  };

  config = lib.mkIf cfg.enable {

    programs = {
      niri.enable = true;

      noctalia = lib.mkIf cfg.noctalia.enable {
        enable = true;
        recommendedServices.enable = lib.mkDefault true;
      };
    };

    funkcia.os.gnome-keyring.enable = lib.mkDefault true;

    security.pam.services.niri = {
      enableGnomeKeyring = lib.mkIf config.services.gnome.gnome-keyring.enable true;
    };

    funkcia.os.gui.niri.recommandSettings =
      with kdl.extras.niri;
      kdl.formats.v1 [
        (spawn-at-startup "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1")
        (xwayland-satellite [
          (n "path" "${lib.getExe pkgs.xwayland-satellite}")
        ])
        (environment [
          (n "QT_QPA_PLATFORM" "wayland")
        ])
      ];

    environment.sessionVariables.NIXOS_OZONE_WL = "1";
  };
}
