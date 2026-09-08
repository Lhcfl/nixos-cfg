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
  config.funkcia.hm.gui.umbriel.settings.keybinds = lib.mkIf cfg.umbriel.enable (
    lib.pipe cfg.binds [
      (lib.mapAttrs (
        _:
        {
          actions,
          allow-when-locked,
          ...
        }:
        let
          action = builtins.head (builtins.attrNames actions);
          arguments = actions.${action};
        in
        {
          action = match action {
            spawn = "spawn:${builtins.concatStringsSep " " arguments}";

            spawn-sh = "spawn:${arguments}";

            focus-workspace = "workspace-switch:${toString arguments}";

            focus-window-relative = "window-focus-" + (lib.strings.toLower arguments);

            move-window-relative = match arguments {
              Left = "column-move-left";
              Right = "column-move-right";
              Up = "window-move-up";
              Down = "window-move-down";
            };

            move-window-to-workspace = "window-move-to-workspace:${toString arguments}";

            screenshot = "spawn:notify-send no-screenshot-action";

            close-window = "window-close";

            quit = "session-quit";

            maximize = "window-toggle-maximize";

            fullscreen = "window-toggle-fullscreen";

            resize-preset = "window-cycle-width";

            show-help = "cheatsheet-toggle";

            toggle-window-floating = "window-toggle-floating";

          };

          allow_when_locked = allow-when-locked;
        }
      ))
    ]

  );
}
