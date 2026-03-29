{ config, ... }:
{
  home.file =
    let
      # ...
      # mkDotfilesLnk = name: {
      #   source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos/home/linca/dotfiles/${name}";
      # };
      mkDotfilesLnk = name: {
        source = ./dotfiles/${name};
      };
      mkConfig = name: {
        name = ".config/${name}";
        value = mkDotfilesLnk name;
      };
    in
    builtins.listToAttrs (
      map mkConfig [
        "kitty"
        "hypr"
        "helix"
        # "mako"
        "waybar"
        "starship.toml"
        "yazi"
        "nvim"
        "dolphinrc"
        "kdeglobals"
        "vicinae"
        "ashell" # waybar replacement # but not used now
        "go-musicfox"
      ]
    );
}
