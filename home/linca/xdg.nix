{ pkgs, ... }:
let
  source =
    path:
    pkgs.lib.pipe ./xdg/${path} [
      builtins.readDir
      builtins.attrNames
      (map (name: {
        name = "${name}";
        # value.source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos/home/linca/dotfiles/${name}";
        value.source = ./xdg/${path}/${name};
      }))
      builtins.listToAttrs
    ];
in
{
  funkcia.hm.xdg.mime.defaultApplications = {
    webFormats = [ "zen.desktop" ];
    wordFormats = [ "writer.desktop" ];
    excelFormats = [ "calc.desktop" ];
    pptFormats = [ "impress.desktop" ];
  };

  xdg = {
    mimeApps = {
      enable = true;
      defaultApplications = {
        "text/plain" = [ "org.gnome.TextEditor.desktop" ];
        "application/pdf" = [ "org.gnome.Papers.desktop" ];
        "x-scheme-handler/mailto" = [ "org.gnome.Geary.desktop" ];
      };
    };

    configFile = source "config";
  };
}
