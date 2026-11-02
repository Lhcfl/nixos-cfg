{
  lib,
  config,
  ...
}:
{
  options.funkcia.hm.ricing.transparency = {
    enable = lib.mkEnableOption "使得一些软件变得透明" // {
      default = true;
    };

    opacity = lib.mkOption {
      description = "透明度";
      type = lib.types.float;
      default = 0.85;
    };

    onlyTerminal = lib.mkEnableOption "只有终端是透明的";
  };

  config =
    let
      cfg = config.funkcia.hm.ricing.transparency;
    in
    lib.mkIf cfg.enable {
      tessera.settings.window-rule.transparency = {
        match = [
          { app_id = "code"; }
          { app_id = "org.telegram.desktop"; }
          { app_id = "v2rayN"; }
          { app_id = "org.gnome.Nautilus"; }
        ];
        opacity = if cfg.onlyTerminal then 1.0 else cfg.opacity;
        blur = true;
      };

      programs.alacritty.settings.window.opacity = cfg.opacity * 0.9;
      programs.kitty.settings.background_opacity = cfg.opacity * 0.9;
    };
}
