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
          options.type = lib.mkOption {
            description = "auth type";
            type = lib.types.enum [ "api_key" ];
          };
          options.key-path = lib.mkOption {
            description = "API key 的实际存储位置。可以是 sops 的路径。";
            type = lib.types.str;
          };
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

        funkcia.hm = {
          agents.md.path = [
            ".pi/agent/AGENTS.md"
          ];

          merge-files.".pi/agent/settings.json" = cfg.settings;
        };
      }

      (lib.mkIf (cfg.auth != { }) {
        home.file.".pi/agent/auth.json".text = lib.pipe cfg.auth [
          (lib.mapAttrs (
            _: value: {
              inherit (value) type;
              key = "!cat \"${value.key-path}\"";
            }
          ))
          builtins.toJSON
        ];
      })
    ]
  );
}
