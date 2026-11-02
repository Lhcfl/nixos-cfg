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
in
{
  config = lib.mkIf (config.funkcia.hm.gui.enable && (osConfig.programs.niri.enable or false)) {
    tessera.niri.enable = true;

    tessera.niri.includes = [
      {
        source = "${pkgs.writeText "tessera-niri-linca.kdl" (
          with kdl.extras.niri;
          kdl.formats.v1 [
            # 来自原 home/modules/gui/niri.nix 的 niri 会话默认值
            (spawn-at-startup (lib.getExe pkgs.funkcia.niri-follow-pip))
            (xwayland-satellite [
              (n "path" "${lib.getExe pkgs.xwayland-satellite}")
            ])
            # 固定像素宽度的 PiP 规则仍留在 niri 原生配置里；
            # 统一 window-rule 目前只能表达 proportional extent。
            (window-rule [
              (match { title = "Picture-in-Picture"; })
              (open-floating true)
              (default-column-width [ (fixed 480) ])
              (default-window-height [ (fixed 270) ])
              (default-floating-position {
                x = 32;
                y = 32;
                relative-to = "bottom-right";
              })
            ])

            # 统一 window-rule 目前没有 window 级别的 background_effect。
            (window-rule [
              (match { is-floating = true; })
              (background-effect [
                (xray false)
              ])
            ])

            prefer-no-csd

            (screenshot-path "~/Pictures/Screenshots/Screenshot from %Y-%m-%d %H-%M-%S.png")

            (cursor [
              (xcursor-size 24)
              hide-when-typing
            ])

            (hotkey-overlay [
              hide-not-bound
              skip-at-startup
            ])

            (blur [
              (passes 3)
              (offset 3.0)
              (noise 0.02)
              (saturation 1.5)
            ])

            (input [
              (touchpad [
                tap
                natural-scroll
                dwt
              ])
              # focus-follows-mouse 由 tessera.settings.input 生成
            ])

            (overview [
              (workspace-shadow [
                off
              ])
            ])

            (layout [
              (gaps 3)
              (struts [
                (top (-4))
              ])
              (background-color "transparent")
              (center-focused-column "never")
              (default-column-width [
                (proportion 0.49)
              ])
              (preset-column-widths [
                (proportion 0.33)
                (proportion 0.49)
                (proportion 0.65)
                (proportion 0.98)
              ])
              (focus-ring [
                off
              ])
              (border [
                (width 2)
                (inactive-color "#595959aa")
                (active-gradient {
                  from = "#ddaa77ee";
                  to = "#eebb99ee";
                  angle = 45;
                  relative-to = "workspace-view";
                })
              ])
            ])

            (binds [
              (n "Mod+Up" { hotkey-overlay-title = "Focus Up"; } [
                (spawn "nu" ./niri-mod-up-down.nu "true")
              ])
              (n "Mod+Down" { hotkey-overlay-title = "Focus Down"; } [
                (spawn "nu" ./niri-mod-up-down.nu "false")
              ])
              (n "Mod+Shift+Up" { hotkey-overlay-title = "Move Window Down"; } [
                (spawn "nu" ./niri-mod-up-down.nu "true" "-m")
              ])
              (n "Mod+Shift+Down" { hotkey-overlay-title = "Move Window Down"; } [
                (spawn "nu" ./niri-mod-up-down.nu "false" "-m")
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
