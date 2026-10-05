{
  inputs,
  funkcia-utils,
  self,
  this,
  lib,
  ...
}:
let
  inherit (inputs) nixpkgs home-manager;
in
{
  this.options = lib.mkOption {
    description = ''
      Device-specific Home Manager configurations. Each attribute name becomes a
      `homeConfigurations.<name>` output
    '';

    type = lib.types.attrsOf (
      lib.types.submodule (
        { name, ... }: {
          options.system = lib.mkOption {
            type = lib.types.enum [
              "x86_64-linux"
            ];

            description = "system of ${name}";
          };

          options.config = lib.mkOption {
            type = lib.types.raw;
            default = { };
            description = ''
              Home Manager configurations config
            '';

            example = lib.literalExpression ''
              {
                imports = [
                  ./devices/my-laptop/configuration.nix
                ];
              }
            '';
          };
        }
      )
    );
  };

  config.flake.homeConfigurations = lib.flip lib.mapAttrs this.config (
    name:
    { system, config, ... }:
    home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.${system};

      modules = [
        self.homeModules.default
        self.homeModules.shared
        config
      ];

      extraSpecialArgs = { inherit inputs funkcia-utils; };
    }
  );
}
