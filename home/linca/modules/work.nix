{
  pkgs,
  lib,
  config,
  ...
}:
let
  cfg = config.linca.work;

  # nixpkgs 的 cargo setup hook 全局强制 ZSTD_SYS_USE_PKG_CONFIG=1，但
  # cc-switch-cli 没有 pkg-config/zstd 依赖，导致 zstd-sys 构建脚本 panic。
  # 关掉 system libs 强制后，zstd-sys 会改用内置源码构建。
  cc-switch-cli' = pkgs.cc-switch-cli.overrideAttrs (_: {
    dontCargoUseSystemLibs = true;
  });
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
      cc-switch-cli'
      android-tools
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
