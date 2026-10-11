{ pkgs, ... }: {
  home.packages = with pkgs; [
    ruffle
  ];

  xdg.mimeApps.defaultApplications = {
    "application/vnd.adobe.flash.movie" = [ "ruffle.desktop" ];
  };
}
