# home manager niri module
{
  inputs,
  lib,
  pkgs,
  config,
  osConfig,
  ...
}:
let
  cfg = config.funkcia.hm.gui.wms.niri;
  kdl = inputs.nix-kdl.kdl;
in
{
  options.funkcia.hm.gui.wms.niri = {
    settings = lib.mkOption {
      default = [ ];
      type = lib.types.lines;
      description = "lines of niri config parts";
    };
  };

  config = lib.mkIf osConfig.programs.niri.enable {
    lib.funkcia.niri.mkInclude = name: text: ''include "${pkgs.writeText "${name}.kdl" text}"'';

    xdg.configFile."niri/config.kdl".text = cfg.settings;

    funkcia.hm.gui.wms.niri.settings = lib.mkMerge [
      (lib.mkBefore (
        config.lib.funkcia.niri.mkInclude "os-recommand" osConfig.funkcia.os.gui.niri.recommandSettings
      ))
      (
        with kdl.extras.niri;
        kdl.formats.v1 [
          (spawn-at-startup (lib.getExe pkgs.funkcia.niri-follow-pip))

          (window-rule [
            (match { title = "Picture-in-Picture"; })
            (open-floating true)
            (default-column-width [ (fixed 480) ])
            (default-window-height [ (fixed 270) ])
            (default-floating-position {
              x = 32;
              y = 32;
              relative-to = "bottom-right";
            })
          ])
        ]
      )
      (lib.mkAfter ''
        include optional=true "noctalia.kdl"
        include optional=true "customize.kdl"
      '')
    ];
  };
}
