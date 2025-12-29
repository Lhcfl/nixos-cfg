{ config, ... }:
{
  home.file =
    let
      mkDotfilesLnk = name: {
        # 😭️ if we use relative sym link, hyprland will broken
        source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos/home/linca/dotfiles/${name}";
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
        "mako"
        "waybar"
        "starship.toml"
        "yazi"
        "nvim"
        "dolphinrc"
        "kdeglobals"
        "vicinae"
        "ashell"
      ]
    );
}
