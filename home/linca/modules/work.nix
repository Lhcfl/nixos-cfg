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
    funkcia.hm = {
      programs.dsh.enable = true;
      programs.dsh.systemd.enable = true;
    };

    home.packages = with pkgs; [
      tree-sitter
      vscode-json-languageserver
      tombi # toml LSP
      devenv
      ast-grep
      typst
      poppler-utils
      agent-browser # headless browser automation CLI for AI agents
      cc-switch-cli
    ];

    # pandoc 导出 PDF：默认引擎是 pdflatex（需 texlive），这里改用已安装的 typst。
    # 注意 pandoc 的 typst 模板默认 font 为空，需通过 mainfont 变量指定字体。
    programs.pandoc = {
      enable = true;
      defaults = {
        pdf-engine = "typst";
        variables.mainfont = "Noto Serif";
      };
    };

    funkcia.hm.agents = {
      enable = true;
      md.text = builtins.readFile ../assets/AGENTS.md;
    };

    programs.direnv.enable = true;
  };
}
