{ config, pkgs, ... }:
{
  home = {
    username = "linca";
    homeDirectory = "/home/linca";
    stateVersion = "26.05";
  };

  programs.home-manager.enable = true;

  imports = [
    ./packages.nix
    ./dotfiles.nix
    ./shell.nix
    ./environment.nix
  ];

  programs.git = {
    enable = true;
    settings = {
      init = {
        defaultBranch = "main";
      };
      user = {
        mame = "linca";
        email = "lhcfl@outlook.com";
      };
    };
  };
}
