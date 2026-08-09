{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.funkcia.hm.gui.components.gnome;
in
{
  options.funkcia.hm.gui.components.gnome = {
    enable = lib.mkEnableOption "GNOME components";
    theme = {
      name = lib.mkOption {
        default = "Adwaita";
        type = lib.types.str;
        description = "The GTK theme to use for GNOME components";
      };

      package = lib.mkOption {
        default = with pkgs; [
          adwaita-icon-theme
          gnome-themes-extra
        ];
        type = lib.types.listOf lib.types.package;
        description = "The packages providing the GTK theme to use for GNOME components";
      };
    };
  };

  config = lib.mkIf cfg.enable {
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

    gtk = {
      enable = true;
      iconTheme.name = cfg.theme.name;
      theme.name = cfg.theme.name;
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
