{
  inputs,
  lib,
  pkgs,
  ...
}:
{
  xdg.configFile."niri/hm-generated.kdl".text =
    with inputs.nix-kdl.kdl.extras.niri;
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
    inputs.nix-kdl.kdl.formats.v1 [
      (spawn-at-startup "fcitx5")
      (spawn-at-startup "firefox")
      (spawn-at-startup "kitty")
      (spawn-at-startup "v2rayN")
      (spawn-at-startup "noctalia")
      (spawn-at-startup "vicinae" "server")
      (spawn-at-startup "~/.local/bin/start-gnome-polkit")

      (prefer-no-csd)

      (environment [
        (n "QT_QPA_PLATFORM" "wayland")
      ])

      (screenshot-path "~/Pictures/Screenshots/Screenshot from %Y-%m-%d %H-%M-%S.png")

      (xwayland-satellite [
        (n "path" "${lib.getExe pkgs.xwayland-satellite}")
      ])

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
        ]
      ))
    ];
}
