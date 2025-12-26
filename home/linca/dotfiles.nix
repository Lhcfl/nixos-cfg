{ config, ... }:
{
  home.file =
    let
      mkDotfilesLnk = name: {
        # 😭️ if we use relative sym link, hyprland will broken
        source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos/home/linca/dotfiles/${name}";
      };
    in
    {
      ".config/kitty" = mkDotfilesLnk "kitty";
      ".config/hypr" = mkDotfilesLnk "hypr";
      ".config/helix" = mkDotfilesLnk "helix";
      ".config/mako" = mkDotfilesLnk "mako";
      ".config/waybar" = mkDotfilesLnk "waybar";
      ".config/starship.toml" = mkDotfilesLnk "starship.toml";
      ".config/yazi" = mkDotfilesLnk "yazi";
    };
}
