{
  lib,
  pkgs,
  config,
  ...
}:
let
  cfg = config.funkcia.hm.programs.pi;
in
{
  options.funkcia.hm.programs.pi = {
    enable = lib.mkEnableOption "pi coding agent";

    settings = lib.mkOption {
      description = "pi settings.json content (merged into ~/.pi/agent/settings.json)";
      type = lib.types.submodule {
        options.packages = lib.mkOption {
          default = [ ];
          description = "packages of pi";
          type = lib.types.listOf lib.types.str;
        };
        freeformtype = lib.types.attrsOf lib.types.json;
      };
    };
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      pi-coding-agent
    ];

    home.activation.piMergeSettings =
      let
        path = "${config.home.homeDirectory}/.pi/agent/settings.json";
        settings = pkgs.writeText "pi-settings.json" (builtins.toJSON cfg.settings);
      in
      lib.hm.dag.entryAfter [ "writeBoundary" ] ''
        ${lib.getExe pkgs.nushell} -c \
          "try { open ${path} } catch {{}}  | merge deep (open ${settings}) | save --force ${path}"
      '';
  };
}
