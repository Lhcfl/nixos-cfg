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
  xdg.configFile = source "config";
}
