input@{ pkgs, ... }:
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

  inherit (import ./xdg/mime.nix input) buildMap formats;
in
{
  xdg = {
    mimeApps = {
      enable = true;
      defaultApplications =
        buildMap [ "zen.desktop" ] formats.webFormats
        // buildMap [ "org.gnome.Loupe.desktop" ] formats.imageFormats
        // buildMap [ "org.gnome.FileRoller.desktop" ] formats.archiveFormats
        // buildMap [ "org.gnome.Decibels.desktop" ] formats.audioFormats
        // buildMap [ "org.gnome.Totem.desktop" ] formats.videoFormats
        // buildMap [ "writer.desktop" ] formats.wordFormats
        // buildMap [ "calc.desktop" ] formats.excelFormats
        // buildMap [ "impress.desktop" ] formats.pptFormats
        // {
          "inode/directory" = [ "org.gnome.Nautilus.desktop" ];
          "text/plain" = [ "org.gnome.TextEditor.desktop" ];
          "application/pdf" = [ "org.gnome.Papers.desktop" ];
          "x-scheme-handler/mailto" = [ "org.gnome.Geary.desktop" ];
        };
    };
    configFile = source "config";
  };

}
