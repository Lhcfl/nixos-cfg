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
  options.linca.tex.enable = lib.mkEnableOption "LaTeX toolchain (tectonic + TeX Live/latexmk)";

  config = lib.mkIf cfg.enable {
    home.packages = [
      pkgs.tex-fmt
      pkgs.tectonic
      (pkgs.texliveMedium.withPackages (
        ps: with ps; [
          latexmk # latexmk 不在 scheme 里，必须单列

          # 论文用到的额外宏包。注意 attr 名与 .sty 名不一致的情况：
          #   zref-savepos / zref-user → zref
          #   newtxmath               → newtx
          #   zi4（Inconsolata 等宽） → inconsolata
          #   manyfoot                → ncctools（NCCTools 合集）
          comment # acmart 无条件加载（\excludecomment{CCSXML}）
          bigfoot # manyfoot 一系
          mathpartir
          stmaryrd
          enumitem
          multirow
          wrapfig
          xstring # 依赖 ifmtarg
          ifmtarg
          totpages
          environ
          framed
          zref
          hyperxmp
          ncctools
          libertine
          inconsolata
          newtx
          upquote
        ]
      ))
    ];
  };
}
