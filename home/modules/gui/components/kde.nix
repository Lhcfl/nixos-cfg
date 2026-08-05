{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.funkcia.hm.gui.components.kde;
in
{
  options.funkcia.hm.gui.components.kde = {
    enable = lib.mkEnableOption "Enable KDE components";
  };

  config = lib.mkIf cfg.enable {
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

    funkcia.hm.xdg.mime.defaultApplications = {
      explorerFormats = [ "org.kde.dolphin.desktop" ];
      imageFormats = [ "org.kde.gwenview.desktop" ];
      archiveFormats = [ "org.kde.ark.desktop" ];
    };
  };
}
