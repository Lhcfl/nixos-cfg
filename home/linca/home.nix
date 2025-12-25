{ config, pkgs, ... }:
{
  home.username = "linca";
  home.homeDirectory = "/home/linca";

  home.packages = with pkgs; [
    vscode
    waybar
    gcc
  ];

  home.stateVersion = "26.05";
  programs.home-manager.enable = true;
}
