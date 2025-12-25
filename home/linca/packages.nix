{ pkgs, ... }:
{
  home.packages = with pkgs; [
    vscode
    qq
    yazi
    gcc
    tree-sitter
    nil
    nixd
    hyprlauncher
    nodejs_latest
    statix
    vscode-json-languageserver
    mako
    telegram-desktop
  ];
}
