{
  inputs,
  lib,
  pkgs,
  ...
}:
let
  kdl = inputs.nix-kdl.kdl;
in
{
  funkcia.hm.gui.wm-keybinding.niri.enable = true;

  funkcia.hm.gui.niri.settings = (
    with kdl.extras.niri;
    kdl.formats.v1 [
      (spawn-at-startup "fcitx5")

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
        # focus-follows-mouse
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

      # default window rule
      (window-rule [
        (geometry-corner-radius 10)
        (clip-to-geometry true)
        (draw-border-with-background false)
        (background-effect [
          (blur true)
        ])
      ])

      # default floating rule
      (window-rule [
        (match { is-floating = true; })
        (background-effect [
          (xray false)
        ])
      ])

      (binds [
        (n "Mod+N" [
          (focus-workspace 255)
        ])
        (n "Mod+Shift+N" [
          (move-column-to-workspace 255)
        ])
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
        (n "Ctrl+Alt+A" [
          # (spawn-sh "grim -g \"$(slurp)\" -t png - | wl-copy -t image/png")
          (spawn-sh "noctalia msg screenshot-region")
        ])
        (n "XF86MonBrightnessUp" { allow-when-locked = true; } [
          (spawn-sh "noctalia msg brightness-up")
        ])
        (n "XF86MonBrightnessDown" { allow-when-locked = true; } [
          (spawn-sh "noctalia msg brightness-down")
        ])
        (n "Mod+G" [
          toggle-column-tabbed-display
        ])
        (n "Mod+C" [
          center-column
        ])
        (n "Mod+Tab" [
          focus-workspace-previous
        ])
      ])
    ]
  );
}
