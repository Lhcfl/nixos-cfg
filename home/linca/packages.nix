{ pkgs, ... }:
{
  home.packages = with pkgs; [
    tree-sitter
    statix # nix lsp
    vscode-json-languageserver
    tombi # toml LSP
    go-musicfox # music
    # elan # lean
    fastfetch # system info
    devenv
    ast-grep
    typst
    gh
    openssl
    dotenv-cli
  ];
}
