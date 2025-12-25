{ config, pkgs, ... }:
{
  home.username = "linca";
  home.homeDirectory = "/home/linca";

  home.packages = with pkgs; [
    vscode
    qq
    yazi
    waybar
    gcc
    tree-sitter
    nil
    nixd
  ];

  home.stateVersion = "26.05";
  programs.home-manager.enable = true;

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
