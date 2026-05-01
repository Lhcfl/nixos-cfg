{
  config,
  lib,
  pkgs,
  ...
}:
{
  config =
    let
      cfg = config.funkcia.hm.gui;
    in
    lib.mkIf (cfg.enable && cfg.preset == "gnome") {
      home.packages = with pkgs; [
        # File manager
        nautilus

        # Image viewer
        eog

        # GNOME runtime/theme integration
        adwaita-icon-theme
        gnome-themes-extra

        # Apps
        gnome-photos
        gnome-video-effects
        gnome-clocks
        gnome-disk-utility
        gnome-system-monitor
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

      xdg.mimeApps = {
        enable = true;

        defaultApplications = {
          "inode/directory" = [ "org.gnome.Nautilus.desktop" ];

          "x-scheme-handler/file" = [ "org.gnome.Nautilus.desktop" ];
          "x-scheme-handler/about" = [ "org.gnome.Nautilus.desktop" ];

          "image/png" = [ "org.gnome.eog.desktop" ];
          "image/jpeg" = [ "org.gnome.eog.desktop" ];
          "image/webp" = [ "org.gnome.eog.desktop" ];
        };
      };
    };
}
