{
  inputs,
  lib,
  config,
  osConfig,
  pkgs,
  ...
}:
let
  kdl = inputs.nix-kdl.kdl;
  modUpDown = ./niri-mod-up-down.nu;
in
{
  config = lib.mkIf (config.funkcia.hm.gui.enable && (osConfig.programs.niri.enable or false)) {
    tessera.niri.enable = true;

    # niri 专属、umbriel 没有对应语义的配置继续放在 include 里。
    tessera.niri.includes = [
      {
        source = "${pkgs.writeText "tessera-niri-linca-extra.kdl" (
          with kdl.extras.niri;
          kdl.formats.v1 [
            (spawn-at-startup (lib.getExe pkgs.funkcia.niri-follow-pip))

            (xwayland-satellite [
              (n "path" "${lib.getExe pkgs.xwayland-satellite}")
            ])

            (binds [
              (n "Mod+Up" { hotkey-overlay-title = "Focus Up"; } [
                (spawn "nu" modUpDown "true")
              ])
              (n "Mod+Down" { hotkey-overlay-title = "Focus Down"; } [
                (spawn "nu" modUpDown "false")
              ])
              (n "Mod+Shift+Up" { hotkey-overlay-title = "Move Window Up"; } [
                (spawn "nu" modUpDown "true" "-m")
              ])
              (n "Mod+Shift+Down" { hotkey-overlay-title = "Move Window Down"; } [
                (spawn "nu" modUpDown "false" "-m")
              ])

              (n "Mod+WheelScrollDown" { cooldown-ms = 150; } [
                focus-workspace-down
              ])
              (n "Mod+WheelScrollUp" { cooldown-ms = 150; } [
                focus-workspace-up
              ])

              (n "Mod+G" [
                toggle-column-tabbed-display
              ])
              (n "Mod+Tab" [
                focus-workspace-previous
              ])
            ])
          ]
        )}";
      }
      {
        optional = true;
        source = "customize.kdl";
      }
    ];
  };
}
