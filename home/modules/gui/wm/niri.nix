{
  inputs,
  lib,
  config,
  ...
}:
let
  inherit (inputs.nix-kdl) kdl;
  inherit (kdl.extras) niri;
  inherit (niri) n raw;

  percentage = x: (toString (x * 100)) + "%";

  cfg = config.funkcia.hm.gui.wm;
  match = str: defs: defs.${str} or defs.default;
  rmap = lib.flip map;

  binding = lib.flip lib.mapAttrsToList cfg.keybinding (
    key: value:
    let
      inherit (value) title allow-when-locked;
      actions = lib.pipe value.actions [
        lib.attrsToList
        (builtins.filter (x: x.value != null))
      ];

      body = rmap actions (
        { name, value }:
        match name {
          spawn = lib.foldl (f: f) (n "spawn") value;
          spawn-sh = n "spawn-sh" value;
          focus-workspace = n "focus-workspace" value;
          focus-window-relative = match value {
            Left = n "focus-column-left";
            Right = n "focus-column-right";
            Up = n "focus-window-up";
            Down = n "focus-window-down";
          };
          move-window-relative = match value {
            Left = n "move-column-left";
            Right = n "move-column-right";
            Up = n "move-window-up";
            Down = n "move-window-down";
          };
          move-workspace-relative = match value {
            Left = n "spawn" "notify-send" "Cannot Move Workspace Left!";
            Right = n "spawn" "notify-send" "Cannot Move Workspace Right!";
            Up = n "move-workspace-up";
            Down = n "move-workspace-down";
          };
          move-window-to-workspace = n "move-column-to-workspace" value;
          screenshot = n "screenshot";
          close-window = n "close-window";
          quit = n "quit";
          maximize = n "maximize-column";
          fullscreen = n "fullscreen-window";
          resize-preset = n "switch-preset-column-width";
          show-help = n "show-hotkey-overlay";
          toggle-window-floating = n "toggle-window-floating";

          # fallback
          "default" = throw (builtins.trace value "${name} not implemented");
        }
      );

      params = lib.foldl (acc: x: acc // x) { } [
        (if allow-when-locked != false then { inherit allow-when-locked; } else { })
        (if title != null then { hotkey-overlay-title = title; } else { })
      ];
    in
    n key params body
  );
in
{
  config.funkcia.hm.gui.niri.settings = lib.mkIf cfg.niri.enable (
    lib.mkBefore (
      config.lib.funkcia.niri.mkInclude "funkcia.gui.wm" (
        kdl.formats.v1 (
          lib.flatten [
            (rmap cfg.spawn-at-startup (n "spawn-sh-at-startup"))
            (lib.mkIf (cfg.environment != { }) (
              (n "environment" (lib.mapAttrsToList (name: value: n name value) cfg.environment))
            ))
            (n "input" [
              (raw "// input settings")
              (lib.mkIf cfg.input.follow-mouse (
                n "focus-follows-mouse" {
                  max-scroll-amount = percentage cfg.input.follow-mouse-max-scroll;
                }
              ))
            ])
            (n "binds" binding)
          ]
        )
      )
    )
  );
}
