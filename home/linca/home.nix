{ config, pkgs, ... }:
{
  home.username = "linca";
  home.homeDirectory = "/home/linca";

  home.stateVersion = "26.05";
  programs.home-manager.enable = true;

  imports = [
    ./packages.nix
  ];

  programs.git = {
    enable = true;
    settings = {
      user = {
        mame = "linca";
        email = "lhcfl@outlook.com";
      };
    };
  };
}
