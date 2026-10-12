{
  this,
  lib,
  pkgs,
  ...
}:
{
  this.options = {
    enable = lib.mkEnableOption "global agents management";

    md = {
      path = lib.mkOption {
        description = "where to put global AGENTS.md, relative to home";
        type = lib.types.listOf lib.types.str;
      };
      text = lib.mkOption {
        description = "global AGENTS.md, per section";
        default = "";
        type = lib.types.lines;
      };
    };
  };

  config = lib.mkIf this.config.enable {
    funkcia.hm.agents.md.path = [ ".agents/AGENTS.md" ];

    home.file = lib.genAttrs this.config.md.path (_: {
      source = pkgs.writeText "AGENTS.md" this.config.md.text;
    });
  };
}
