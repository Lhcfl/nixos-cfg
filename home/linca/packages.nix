{ pkgs, ... }:
{
  home.packages = with pkgs; [
    vscode
    qq
    yazi # terminal file explorer
    gcc
    tree-sitter
    nil # nix lsp
    nixd # nix lsp
    hyprlauncher # hyprland tools
    nodejs_latest
    statix # nix lsp
    vscode-json-languageserver
    mako # notifcation
    telegram-desktop
    # BEGIN 截图
    gradia
    grim
    slurp
    wl-clipboard-rs
    # END 截图
    zed-editor
    hypridle # hyprland tools
    hyprlock # hyprland tools
    tombi # toml LSP
    go-musicfox # music
    python3
    uv # python3
    ninja
  ];
}
