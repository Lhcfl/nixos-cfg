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
    # 截图
    gradia
    grim
    slurp
    wl-clipboard-rs
    zed-editor
    hypridle
    hyprlock
  ];
}
