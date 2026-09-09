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
        freeformType = lib.types.attrsOf lib.types.json;
      };
    };

    auth = lib.mkOption {
      description = "auth keys for pi";
      type = lib.types.attrsOf (
        lib.types.submodule {
          options.type = lib.mkOption { type = lib.types.enum [ "api_key" ]; };
          options.key-path = lib.mkOption { type = lib.types.str; };
        }
      );
    };
  };

  config = lib.mkIf cfg.enable (
    lib.mkMerge [
      {
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
      }

      (lib.mkIf (cfg.auth != { }) {
        home.file.".pi/agent/auth.json".text = lib.pipe cfg.auth [
          (lib.mapAttrs (
            _: value: {
              type = value.type;
              key = "!cat \"${value.key-path}\"";
            }
          ))
          builtins.toJSON
        ];
      })
    ]
  );
}
