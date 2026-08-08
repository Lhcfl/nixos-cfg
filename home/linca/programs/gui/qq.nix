# 神秘修复
# 修复 qq --ozone-platform=wayland 的问题
{ lib, pkgs, ... }: {
  home.packages = [
    (pkgs.qq.overrideAttrs (
      final: prev:
      let
        extra-flag = ''--add-flags "\''${NIXOS_OZONE_WL:+\''${WAYLAND_DISPLAY:+--ozone-platform-hint=auto --enable-features=WaylandWindowDecorations --enable-wayland-ime=true --wayland-text-input-version=3 --enable-features=UseOzonePlatform --ozone-platform=wayland}}" \'';

        splitLines = lib.strings.splitString "\n" prev.installPhase;

        addExtraLine = map (
          line: if lib.strings.hasPrefix "makeShellWrapper" line then line + "\n  " + extra-flag else line
        ) splitLines;
      in
      {
        installPhase = lib.strings.concatStringsSep "\n" addExtraLine;
      }
    ))
  ];
}
