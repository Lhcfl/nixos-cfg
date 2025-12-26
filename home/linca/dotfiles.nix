{ config, ... }:
{
  home.file =
    let
      mkDotfilesLnk = name: config.lib.file.mkOutOfStoreSymlink ./dotfiles/${name};
    in
    {
      ".config/kitty" = mkDotfilesLnk "kitty";
      ".config/hypr" = mkDotfilesLnk "hypr";
      ".config/helix" = mkDotfilesLnk "helix";
      ".config/mako" = mkDotfilesLnk "mako";
    };
}
