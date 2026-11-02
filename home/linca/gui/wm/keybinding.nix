{ lib, ... }: {
  tessera.settings.keybinds = lib.mkMerge (
    lib.flatten [
      # Applications
      {
        "Ctrl+Alt+T".actions.spawn = "kitty";
        "Mod+A".actions.spawn = "alacritty";
        "Mod+B".actions.spawn = "zen";
        "Mod+S".actions.spawn = "kitty nu";
        "Mod+E" = {
          title = "Open Home Folder";
          actions.spawn = "xdg-open ~";
        };
        "Mod+F" = {
          title = "Open Launcher";
          actions.spawn = "noctalia msg panel-toggle launcher";
        };
      }

      # Controls
      {
        "Print".actions.screenshot = { };
        "Ctrl+Alt+A".actions = lib.mkDefault { screenshot = { }; };
        "Mod+Q".actions.window-close = { };
        "Alt+F4".actions.window-close = { };
        "Mod+Delete".actions.session-quit = { };
        "Shift+F11".actions.window-toggle-fullscreen = { };
        "Mod+M".actions.window-toggle-maximize = { };
        "Mod+R".actions.window-cycle-primary-extent = { };
        "Mod+L".actions.spawn = "loginctl lock-session";
        "Mod+Slash".actions.cheatsheet-toggle = { };
        "Mod+Shift+F".actions.window-toggle-floating = { };
        "Mod+P".actions.window-toggle-pinned = { };
        "Mod+T".actions.column-toggle-tabbed = { };
        "Mod+bracketright".actions.column-focus-tab = "Next";
        "Mod+bracketleft".actions.column-focus-tab = "Previous";
        "Mod+Shift+Space".actions.window-toggle-scratchpad = { };
        "Mod+Space".actions.scratchpad-toggle = { };
        "Mod+WheelUp".actions.workspace-focus = "Previous";
        "Mod+WheelDown".actions.workspace-focus = "Next";
      }

      # workspace 1~10
      (map (id: {
        "Mod+${toString id}".actions.workspace-switch = id;
        "Shift+Mod+${toString id}".actions.window-move-to-workspace = id;
      }) (builtins.genList (x: x + 1) 9))

      {
        "Mod+N".actions.workspace-switch = ctx: ctx.workspace.empty.id;
        "Mod+Shift+N".actions.window-move-to-workspace = ctx: ctx.workspace.empty.id;
      }

      # window u/d/l/r
      (map
        (dir: {
          "Mod+${dir}".actions.window-focus = dir;
          "Mod+Shift+${dir}".actions.window-move = dir;
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
          "Mod+Ctrl+Shift+${dir}".actions.workspace-move = dir;
        })
        [
          "Up"
          "Down"
        ]
      )

      # XF86 Keybindings
      (lib.mapAttrs (_: x: lib.mkDefault x // { allow-when-locked = true; }) {
        "XF86AudioMute".actions.spawn = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
        "XF86AudioMicMute".actions.spawn = "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle";
        "XF86AudioLowerVolume".actions.spawn = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-";
        "XF86AudioRaiseVolume".actions.spawn = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+";
        "XF86AudioPlay".actions.spawn = "playerctl play-pause";
        "XF86AudioPause".actions.spawn = "playerctl play-pause";
        "XF86AudioNext".actions.spawn = "playerctl next";
        "XF86AudioPrev".actions.spawn = "playerctl previous";
        "XF86MonBrightnessUp".actions.spawn = "brightnessctl set 5%+";
        "XF86MonBrightnessDown".actions.spawn = "brightnessctl set 5%-";
      })
    ]
  );
}
