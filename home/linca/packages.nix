{ pkgs, ... }:
{
  home.packages = with pkgs; [
    gcc
    tree-sitter
    nil # nix lsp
    nixd # nix lsp
    nixfmt
    nodejs_latest
    corepack_24
    statix # nix lsp
    vscode-json-languageserver
    tombi # toml LSP
    go-musicfox # music
    python3
    uv # python3
    ty
    ruff # python linter
    elan # lean
    llvmPackages.clang-tools
    fastfetch # system info
    devenv
    ast-grep
  ];
}
