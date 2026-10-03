{
  lib,
  config,
  ...
}:
let
  cfg = config.funkcia.hm.gui.wm;
  match = str: defs: defs.${str} or defs.default;
in
{
  config.funkcia.hm.gui.umbriel.settings = lib.mkIf cfg.umbriel.enable {
    general.autostart = cfg.spawn-at-startup;

    input.focus = {
      follows_mouse = cfg.input.follow-mouse;
      follows_mouse_max_scroll = cfg.input.follow-mouse-max-scroll;
    };

    keybinds = lib.flip lib.mapAttrs cfg.keybinding (
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
            Up = "window-move-or-workspace-up";
            Down = "window-move-or-workspace-down";
          };

          move-workspace-relative = match arguments {
            Left = "spawn:notify-send \"Cannot Move Workspace Left!\"";
            Right = "spawn:notify-send \"Cannot Move Workspace Right!\"";
            Up = "workspace-move-up";
            Down = "workspace-move-down";
          };

          move-window-to-workspace = "window-move-to-workspace:${toString arguments}";

          screenshot = lib.mkMerge [
            (lib.mkIf (config.funkcia.hm.gui.noctalia.enable) "spawn:noctalia msg screenshot-fullscreen")
            (lib.mkIf (!config.funkcia.hm.gui.noctalia.enable) "spawn:notify-send no-screenshot-action")
          ];

          close-window = "window-close";

          quit = "session-quit";

          maximize = "window-toggle-maximize";

          fullscreen = "window-toggle-fullscreen";

          resize-preset = "window-cycle-primary-extent";

          show-help = "cheatsheet-toggle";

          toggle-window-floating = "window-toggle-floating";
        };

        allow_when_locked = allow-when-locked;
      }
    );
  };
}
