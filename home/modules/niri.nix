# home manager niri module
{
  lib,
  pkgs,
  config,
  osConfig,
  ...
}:
{
  options.funkcia.gui.niri = {
    settings = lib.mkOption {
      default = [ ];
      type = lib.types.lines;
      description = "lines of niri config parts";
    };
  };

  config = lib.mkIf osConfig.programs.niri.enable {
    lib.funkcia.niri.mkInclude = name: text: ''include "${pkgs.writeText "${name}.kdl" text}"'';

    xdg.configFile."niri/config.kdl".text = config.funkcia.gui.niri.settings;

    funkcia.gui.niri.settings = lib.mkAfter ''
      include optional=true "noctalia.kdl"
      include optional=true "customize.kdl"
    '';
  };
}
