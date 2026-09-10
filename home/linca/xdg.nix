{ pkgs, ... }:
let
  source =
    path:
    pkgs.lib.pipe ./xdg/${path} [
      builtins.readDir
      builtins.attrNames
      (map (name: {
        name = "${name}";
        value.source = ./xdg/${path}/${name};
      }))
      builtins.listToAttrs
    ];
in
{
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
