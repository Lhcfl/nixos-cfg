{
  this,
  lib,
  pkgs,
  ...
}:
{
  this.options = {
    enable = lib.mkEnableOption "GNOME components (NixOS Module)";
  };

  config = lib.mkIf this.config.enable {
    services.gvfs.enable = true;

    services.gnome = {
      core-os-services.enable = true;
      core-apps.enable = true;
    };

    environment.systemPackages = with pkgs; [
      glib
      file-roller
      gnome-themes-extra
      gnome-video-effects
      morewaita-icon-theme
    ];
  };
}
