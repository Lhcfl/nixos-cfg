{
  pkgs,
  lib,
  config,
  ...
}:
let
  cfg = config.linca.work;
in
{
  options.linca.work = {
    enable = lib.mkEnableOption "packages for work";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      tree-sitter
      vscode-json-languageserver
      tombi # toml LSP
      devenv
      ast-grep
      typst
    ];

    programs.pandoc.enable = true;
    programs.direnv.enable = true;
  };
}
