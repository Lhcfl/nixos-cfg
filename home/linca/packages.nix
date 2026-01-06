{ pkgs, ... }:
{
  home.packages = with pkgs; [
    yazi # terminal file explorer
    gcc
    tree-sitter
    nil # nix lsp
    nixd # nix lsp
    nixfmt
    nodejs_latest
    nodePackages.pnpm
    statix # nix lsp
    vscode-json-languageserver
    tombi # toml LSP
    go-musicfox # music
    python3
    uv # python3
    aescrypt
    elan # lean
    llvmPackages.clang-tools
  ];
}
