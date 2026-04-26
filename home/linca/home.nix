{ lib, utils, ... }:
{
  funkcia.hm.gui.enable = lib.mkDefault true;

  home = {
    username = "linca";
    homeDirectory = "/home/linca";

    file = {
      ".face" = {
        source = ./assets/avatar.png;
      };
    };
  };

  programs.home-manager.enable = true;

  imports = [
    ./packages.nix
    ./dotfiles.nix
    ./shell.nix
    ./environment.nix
    ./gui.nix
  ]
  ++ utils.files.listNixFiles ./programs;
}
