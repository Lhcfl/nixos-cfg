{
  config,
  lib,
  ...
}:
let
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

    environment.sessionVariables.NIXOS_OZONE_WL = "1";
  };
}
