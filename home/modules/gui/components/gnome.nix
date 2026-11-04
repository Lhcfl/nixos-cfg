{
  config,
  lib,
  ...
}:
let
  cfg = config.funkcia.hm.gui.components.gnome;
in
{
  options.funkcia.hm.gui.components.gnome = {
    enable = lib.mkEnableOption "GNOME components";
  };

  config = lib.mkIf cfg.enable {
    programs.gnome-shell.enable = true;

    gtk = {
      enable = true;
      iconTheme.name = "MoreWaita";
      theme.name = "Adwaita";
    };

    qt = {
      enable = true;
      platformTheme.name = "gtk3";
    };

    funkcia.hm.xdg.mime.defaultApplications = {
      explorerFormats = [ "org.gnome.Nautilus.desktop" ];
      imageFormats = [ "org.gnome.Loupe.desktop" ];
      archiveFormats = [ "org.gnome.FileRoller.desktop" ];
      audioFormats = [ "org.gnome.Decibels.desktop" ];
      videoFormats = [ "org.gnome.Totem.desktop" ];
    };

    xdg.mimeApps.defaultApplications = {
      "text/plain" = [ "org.gnome.TextEditor.desktop" ];
      "application/pdf" = [ "org.gnome.Papers.desktop" ];
    };
  };
}
