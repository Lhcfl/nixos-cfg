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
    lib.pipe cfg.binds [
      (map (
        {
          bind,
          action,
          arguments,
          ...
        }:
        let
          key = builtins.concatStringsSep "+" bind;
          n = niri.n;
          body = match action {
            spawn = lib.foldl (f: x: f x) (n "spawn") arguments;
            spawn-sh = n "spawn-sh" arguments;
            focus-workspace = n "focus-workspace" arguments;
            focus-window-relative = match arguments {
              Left = n "focus-column-left";
              Right = n "focus-column-right";
              Up = n "focus-window-up";
              Down = n "focus-window-down";
            };
            move-window-relative = match arguments {
              Left = n "move-column-left";
              Right = n "move-column-right";
              Up = n "move-window-up";
              Down = n "move-window-down";
            };
            move-window-to-workspace = n "move-column-to-workspace" arguments;

            # fallback
            "default" = throw (builtins.trace arguments "${action} not implemented");
          };
        in
        niri.n key [ body ]
      ))
      niri.binds
      (x: kdl.formats.v1 [ x ])
      (config.lib.funkcia.niri.mkInclude "keybindings")
    ]
  );
}
