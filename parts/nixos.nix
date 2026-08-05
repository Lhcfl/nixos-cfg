{
  self,
  inputs,
  lib,
  config,
  ...
}:
let
  cfg = config.nixos;
  moduleListType = lib.types.listOf lib.types.raw;
in
{
  options.nixos = {

    devices = lib.mkOption {
      type = lib.types.attrsOf (
        lib.types.submodule {
          options = {
            modules = lib.mkOption {
              type = moduleListType;
              description = ''
                List of NixOS modules for this device. Can contain paths,
                functions, or flake module references (e.g. `someFlake.nixosModules.default`).
              '';
              example = lib.literalExpression ''
                [
                  ./hardware-configuration.nix
                  ./configuration.nix
                  some-flake.nixosModules.default
                ]
              '';
            };
          };
        }
      );
      default = { };
      description = ''
        Device-specific NixOS configurations. Each attribute name becomes a
        `nixosConfigurations.<name>` output, with a corresponding
        `checks.<system>.<name> topLevel` check.
      '';
      example = lib.literalExpression ''
        {
          my-laptop.modules = [
            ./devices/my-laptop/configuration.nix
          ];
          my-server.modules = [
            ./devices/my-server/configuration.nix
          ];
        }
      '';
    };

    sharedModules = lib.mkOption {
      type = moduleListType;
      default = [ ];
      description = ''
        NixOS modules shared across all devices. These are prepended to each
        device's module list before being passed to `nixosSystem`.
      '';
      example = lib.literalExpression ''
        [
          ./home/home-manager.nix
          home-manager.nixosModules.home-manager
          sops-nix.nixosModules.sops
        ] ++ (listNixFilesRec ./global)
          ++ (listNixFilesRec ./modules)
      '';
    };
  };

  config = {
    flake = lib.pipe cfg.devices [
      lib.attrsets.attrsToList

      (map (
        { name, value }: {
          nixosConfigurations.${name} = inputs.nixpkgs.lib.nixosSystem {
            specialArgs = {
              inherit inputs;
            };

            modules = builtins.concatLists [
              cfg.sharedModules
              value.modules
            ];
          };

          checks.x86_64-linux."${name} topLevel" =
            self.nixosConfigurations.${name}.config.system.build.toplevel;
        }
      ))

      (lib.foldl lib.recursiveUpdate { })
    ];
  };
}
