# 神秘修复
# 修复 qq --ozone-platform=wayland 的问题
{
  lib,
  pkgs,
  config,
  ...
}:
{
  home.packages = lib.mkIf config.funkcia.hm.gui.enable [
    (pkgs.qq.overrideAttrs (
      final: prev: {
        installPhase =
          lib.replaceStrings [ "--ozone-platform-hint=auto" ] [ "--ozone-platform=wayland" ]
            prev.installPhase;
      }
    ))
  ];
}
