{
  pkgs,
  lib,
  config,
  ...
}:
let
  cfg = config.linca.tex;
in
{
  options.linca.tex.enable = lib.mkEnableOption "LaTeX toolchain (tectonic)";

  config = lib.mkIf cfg.enable {
    # tectonic：单文件 TeX 引擎，宏包按需下载到 ~/.cache/Tectonic。
    # 已知限制：不支持 Metafont 位图字体（如 bbm 的 \mathbbm），这类文档需要用
    # TeX Live + pdflatex，建议在项目级 shell 里临时提供，不要装进系统。
    home.packages = [ pkgs.tectonic ];
  };
}
