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
      inherit (value) title allow-when-locked actions;

      params = lib.foldl (acc: x: acc // x) { } [
        (lib.optionalAttrs (allow-when-locked != false) { inherit allow-when-locked; })
        (lib.optionalAttrs (title != null) { hotkey-overlay-title = title; })
      ];

      body = lib.flip lib.mapAttrsToList actions (
        name: param:
        match name {
          spawn = lib.foldl (f: f) (n "spawn") param;
          spawn-sh = n "spawn-sh" param;
          focus-workspace = n "focus-workspace" param;
          focus-window-relative = match param {
            Left = n "focus-column-left";
            Right = n "focus-column-right";
            Up = n "focus-window-up";
            Down = n "focus-window-down";
          };
          move-window-relative = match param {
            Left = n "move-column-left";
            Right = n "move-column-right";
            Up = n "move-window-up";
            Down = n "move-window-down";
          };
          move-workspace-relative = match param {
            Left = n "spawn" "notify-send" "Cannot Move Workspace Left!";
            Right = n "spawn" "notify-send" "Cannot Move Workspace Right!";
            Up = n "move-workspace-up";
            Down = n "move-workspace-down";
          };
          move-window-to-workspace = n "move-column-to-workspace" param;
          screenshot = n "screenshot";
          close-window = n "close-window";
          quit = n "quit";
          maximize = n "maximize-column";
          fullscreen = n "fullscreen-window";
          resize-preset = n "switch-preset-column-width";
          show-help = n "show-hotkey-overlay";
          toggle-window-floating = n "toggle-window-floating";

          # fallback
          "default" = throw (builtins.trace param "${name} not implemented");
        }
      );
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
              n "environment" (lib.mapAttrsToList (name: value: n name value) cfg.environment)
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
