{ pkgs, ... }:
{ 
  home.packages = with pkgs; [
    vscode
    qq
    yazi
    waybar
    gcc
    tree-sitter
    nil
    nixd
    hyprlauncher
  ];
}
