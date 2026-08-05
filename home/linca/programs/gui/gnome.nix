{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.funkcia.hm.gui;
in
{
  config = lib.mkIf (cfg.enable && cfg.preset == "gnome") {
    programs.gnome-shell.enable = true;

    home.packages = with pkgs; [
      nautilus # File manager
      loupe # Image viewer
      decibels # audio player
      papers # doc viewer
      file-roller

      # GNOME runtime/theme integration
      adwaita-icon-theme
      gnome-themes-extra

      # Apps
      gnome-photos
      gnome-video-effects
      gnome-clocks
      gnome-disk-utility
      gnome-system-monitor
      gnome-text-editor
      gnome-calendar
      gnome-music
    ];

    # Allow GTK/GNOME apps to read settings properly
    dconf.settings = {
      "org/gnome/desktop/interface" = {
        icon-theme = "Adwaita";
        gtk-theme = "Adwaita";
      };
    };

    gtk = {
      enable = true;

      iconTheme = {
        name = "Adwaita";
        package = pkgs.adwaita-icon-theme;
      };

      theme = {
        name = "Adwaita";
        package = pkgs.gnome-themes-extra;
      };
    };

    xdg.portal = {
      enable = true;

      extraPortals = with pkgs; [ xdg-desktop-portal-gtk ];
    };

    funkcia.hm.xdg.mime.defaultApplications = {
      explorerFormats = [ "org.gnome.Nautilus.desktop" ];
      imageFormats = [ "org.gnome.Loupe.desktop" ];
      archiveFormats = [ "org.gnome.FileRoller.desktop" ];
      audioFormats = [ "org.gnome.Decibels.desktop" ];
      videoFormats = [ "org.gnome.Totem.desktop" ];
    };
  };
}
