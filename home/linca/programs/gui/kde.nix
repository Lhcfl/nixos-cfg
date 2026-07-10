{
  config,
  lib,
  pkgs,
  ...
}:
{
  config = lib.mkIf (config.funkcia.hm.gui.enable && config.funkcia.hm.gui.preset == "kde") {
    home.packages = with pkgs.kdePackages; [
      dolphin # KDE file manager
      qtimageformats # Image format support for Qt5
      ffmpegthumbs # Video thumbnail support
      kde-cli-tools # KDE command line utilities
      kdegraphics-thumbnailers # KDE graphics thumbnails
      kimageformats # Additional image format support for KDE
      qtsvg # SVG support
      kio # KDE I/O framework
      kio-extras # Additional KDE I/O protocols
      kio-fuse # KDE I/O FUSE support
      kwayland # KDE Wayland integration
      ark # archive manager with KDE integration
      gwenview # KDE image viewer
    ];

    xdg.mimeApps = {
      defaultApplications = {
        "inode/directory" = [ "org.kde.dolphin.desktop" ];
        "x-scheme-handler/file" = [ "org.kde.dolphin.desktop" ];
        "x-scheme-handler/about" = [ "org.kde.dolphin.desktop" ];
        "image/png" = [ "org.kde.gwenview.desktop" ];
      };
    };
  };
}
