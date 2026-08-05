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
  funkcia.hm.gui.wms.niri.settings = (
    with kdl.extras.niri;
    let
      workspace-action = id: [
        (n "Mod+${toString id}" [
          (focus-workspace id)
        ])
        (n "Mod+Shift+${toString id}" [
          (move-column-to-workspace id)
        ])
      ];
    in
    kdl.formats.v1 [
      (spawn-at-startup "fcitx5")
      (spawn-at-startup "v2rayN")
      (spawn-at-startup "noctalia")
      (spawn-at-startup "vicinae" "server")

      prefer-no-csd

      (environment [
        (n "QT_QPA_PLATFORM" "wayland")
      ])

      (screenshot-path "~/Pictures/Screenshots/Screenshot from %Y-%m-%d %H-%M-%S.png")

      (cursor [
        (xcursor-size 24)
        hide-when-typing
      ])

      (hotkey-overlay [
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

      (binds (
        lib.flatten [
          (map workspace-action (builtins.genList (x: x + 1) 9))
          (n "Mod+N" [
            (focus-workspace 255)
          ])
          (n "Mod+Shift+N" [
            (move-column-to-workspace 255)
          ])
          (n "Mod+Left" [
            focus-column-left
          ])
          (n "Mod+Right" [
            focus-column-right
          ])
          (n "Mod+Up" [
            focus-window-up
          ])
          (n "Mod+Down" [
            focus-window-down
          ])
          (n "Mod+Shift+Left" [
            move-column-left
          ])
          (n "Mod+Shift+Right" [
            move-column-right
          ])
          (n "Mod+Shift+Up" [
            move-window-to-workspace-up
          ])
          (n "Mod+Shift+Down" [
            move-window-to-workspace-down
          ])

          (n "Mod+WheelScrollDown" { cooldown-ms = 150; } [
            focus-workspace-down
          ])
          (n "Mod+WheelScrollUp" { cooldown-ms = 150; } [
            focus-workspace-up
          ])
          (n "Ctrl+Alt+T" [
            (spawn "kitty")
          ])
          (n "Mod+S" [
            (spawn-sh "kitty nu")
          ])
          (n "Mod+E" [
            (spawn-sh "xdg-open ~")
          ])
          (n "Mod+B" [
            (spawn "zen")
          ])
          # (n "XF86Favorites" [
          #   (spawn "keepassxc")
          # ])
          (n "Mod+F" [
            (spawn "vicinae" "toggle")
          ])
          (n "Print" [
            (screenshot { show-pointer = false; })
          ])
          (n "Ctrl+Alt+A" [
            # (spawn-sh "grim -g \"$(slurp)\" -t png - | wl-copy -t image/png")
            (spawn-sh "noctalia msg screenshot-region")
          ])
          (n "XF86AudioMute" { allow-when-locked = true; } [
            (spawn "wpctl" "set-mute" "@DEFAULT_AUDIO_SINK@" "toggle")
          ])
          (n "XF86AudioMicMute" { allow-when-locked = true; } [
            (spawn "wpctl" "set-mute" "@DEFAULT_AUDIO_SOURCE@" "toggle")
          ])
          (n "XF86AudioLowerVolume" { allow-when-locked = true; } [
            (spawn "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "5%-")
          ])
          (n "XF86AudioRaiseVolume" { allow-when-locked = true; } [
            (spawn "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "5%+")
          ])
          (n "XF86AudioPlay" { allow-when-locked = true; } [
            (spawn "playerctl" "play-pause")
          ])
          (n "XF86AudioPause" { allow-when-locked = true; } [
            (spawn "playerctl" "play-pause")
          ])
          (n "XF86AudioNext" { allow-when-locked = true; } [
            (spawn "playerctl" "next")
          ])
          (n "XF86AudioPrev" { allow-when-locked = true; } [
            (spawn "playerctl" "previous")
          ])
          (n "XF86MonBrightnessUp" { allow-when-locked = true; } [
            (spawn-sh "noctalia msg brightness-up")
          ])
          (n "XF86MonBrightnessDown" { allow-when-locked = true; } [
            (spawn-sh "noctalia msg brightness-down")
          ])
          (n "Mod+Q" { hotkey-overlay-title = null; } [
            close-window
          ])
          (n "Alt+F4" { hotkey-overlay-title = null; } [
            close-window
          ])
          (n "Mod+Delete" { allow-inhibiting = false; } [
            quit
          ])
          (n "Mod+Shift+F" [
            toggle-window-floating
          ])
          (n "Mod+G" [
            toggle-column-tabbed-display
          ])
          (n "Shift+F11" [
            fullscreen-window
          ])
          (n "Mod+M" [
            maximize-column
          ])
          (n "Mod+C" [
            center-column
          ])
          (n "Mod+Tab" [
            focus-workspace-previous
          ])
          (n "Mod+R" [
            switch-preset-column-width
          ])
        ]
      ))
    ]
  );
}
