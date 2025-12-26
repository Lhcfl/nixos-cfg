{ config, ... }:
{
  home.file = {
    ".config/kitty" = {
      source = config.lib.file.mkOutOfStoreSymlink ./dotfiles/kitty;
    };
    ".config/hypr" = {
      source = config.lib.file.mkOutOfStoreSymlink ./dotfiles/hypr;
    };
  };
}
