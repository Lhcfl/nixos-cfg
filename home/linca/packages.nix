{ pkgs, ... }:
{
  home.packages = [
    (pkgs.corepack.override { nodejs-slim = pkgs.nodejs-slim_latest; })
  ]
  ++ (with pkgs; [
    gcc
    tree-sitter
    nil # nix lsp
    nixd # nix lsp
    nixfmt
    nodejs_latest
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
    typst
    gh
    biome
  ]);
}
