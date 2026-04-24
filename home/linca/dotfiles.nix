{ pkgs, ... }:
{
  home.file =
    # hyprland cannot dynnamically reload config of lnk, which is very strange.
    # mkDotfilesLnk = name: {
    #   source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos/home/linca/dotfiles/${name}";
    # };
    pkgs.lib.pipe ./dotfiles [
      builtins.readDir
      builtins.attrNames
      (builtins.map (name: {
        name = ".config/${name}";
        value.source = ./dotfiles/${name};
      }))
      builtins.listToAttrs
    ];

}
