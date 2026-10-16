{ lib, ... }: {
  funkcia.hm.gui.wm.keybinding = lib.mkMerge (
    lib.flatten [
      # Applications
      {
        "Ctrl+Alt+T".actions.spawn = [ "kitty" ];
        "Mod+A".actions.spawn = [ "alacritty" ];
        "Mod+B".actions.spawn = [ "zen" ];
        "Mod+S".actions.spawn-sh = "kitty nu";
        "Mod+E" = {
          title = "Open Home Folder";
          actions.spawn-sh = "xdg-open ~";
        };
        "Mod+F" = {
          title = "Open Launcher";
          actions.spawn-sh = "vicinae toggle";
        };
      }

      # Controls
      {
        "Print".actions.screenshot = { };
        "Ctrl+Alt+A".actions = lib.mkDefault { screenshot = { }; };
        "Mod+Q".actions.close-window = { };
        "Alt+F4".actions.close-window = { };
        "Mod+Delete".actions.quit = { };
        "Shift+F11".actions.fullscreen = { };
        "Mod+M".actions.maximize = { };
        "Mod+R".actions.resize-preset = { };
        "Mod+L".actions.spawn-sh = "loginctl lock-session";
        "Mod+Slash".actions.show-help = { };
        "Mod+Shift+F".actions.toggle-window-floating = { };
        "Mod+P".actions."toggle-window-pinned" = { };
        "Mod+T".actions."toggle-column-tabbed" = { };
        "Mod+bracketright".actions."focus-column-tab-relative" = "Next";
        "Mod+bracketleft".actions."focus-column-tab-relative" = "Previous";
        "Mod+Shift+Space".actions."toggle-window-scratchpad" = { };
        "Mod+Space".actions."toggle-scratchpad" = { };
        "Mod+WheelUp".actions."focus-workspace-relative" = "Previous";
        "Mod+WheelDown".actions."focus-workspace-relative" = "Next";
      }

      # workspace 1~10
      (map (id: {
        "Mod+${toString id}".actions.focus-workspace = id;
        "Shift+Mod+${toString id}".actions.move-window-to-workspace = id;
      }) (builtins.genList (x: x + 1) 9))

      # window u/d/l/r
      (map
        (dir: {
          "Mod+${dir}".actions.focus-window-relative = dir;
          "Mod+Shift+${dir}".actions.move-window-relative = dir;
        })
        [
          "Left"
          "Right"
          "Up"
          "Down"
        ]
      )

      # workspace u/d
      (map
        (dir: {
          "Mod+Ctrl+Shift+${dir}".actions.move-workspace-relative = dir;
        })
        [
          "Up"
          "Down"
        ]
      )

      # XF86 Keybindings
      (lib.mapAttrs (_: x: lib.mkDefault x // { allow-when-locked = true; }) {
        "XF86AudioMute".actions.spawn-sh = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
        "XF86AudioMicMute".actions.spawn-sh = "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle";
        "XF86AudioLowerVolume".actions.spawn-sh = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-";
        "XF86AudioRaiseVolume".actions.spawn-sh = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+";
        "XF86AudioPlay".actions.spawn-sh = "playerctl play-pause";
        "XF86AudioPause".actions.spawn-sh = "playerctl play-pause";
        "XF86AudioNext".actions.spawn-sh = "playerctl next";
        "XF86AudioPrev".actions.spawn-sh = "playerctl previous";
        "XF86MonBrightnessUp".actions.spawn-sh = "brightnessctl set 5%+";
        "XF86MonBrightnessDown".actions.spawn-sh = "brightnessctl set 5%-";
      })
    ]
  );
}
