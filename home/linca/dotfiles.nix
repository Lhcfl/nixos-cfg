{ config, ... }:
{
  home.file =
    let
      mkDotfilesLnk = name: {
        source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/${name}";
      };
    in
    {
      ".config/kitty" = mkDotfilesLnk "kitty";
      ".config/hypr" = mkDotfilesLnk "hypr";
      ".config/helix" = mkDotfilesLnk "helix";
      ".config/mako" = mkDotfilesLnk "mako";
      ".config/waybar" = mkDotfilesLnk "waybar";
    };
}
