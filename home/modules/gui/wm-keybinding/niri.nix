{
  inputs,
  lib,
  config,
  ...
}:
let
  cfg = config.funkcia.hm.gui.wm-keybinding;
  match = str: defs: if defs ? ${str} then defs.${str} else defs.default;
in
{
  config.funkcia.hm.gui.niri.settings = lib.mkIf cfg.niri.enable (
    let
      kdl = inputs.nix-kdl.kdl;
      niri = kdl.extras.niri;
    in
    lib.pipe cfg.utils.converted [
      (map (
        {
          bind,
          actions,
          allow-when-locked,
          ...
        }:
        let
          key = bind;
          n = niri.n;
          body = map (
            { name, value }:
            match name {
              spawn = lib.foldl (f: x: f x) (n "spawn") value;
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
              move-window-to-workspace = n "move-column-to-workspace" value;

              # fallback
              "default" = throw (builtins.trace value "${name} not implemented");
            }
          ) actions;

          params = lib.foldl (acc: x: acc // x) { } [
            (if allow-when-locked != false then { allow-when-locked = allow-when-locked; } else { })
          ];
        in
        n key params body
      ))
      niri.binds
      (x: kdl.formats.v1 [ x ])
      # (config.lib.funkcia.niri.mkInclude "keybindings")
    ]
  );
}
