{
  self,
  inputs,
  lib,
  config,
  funkcia-utils,
  ...
}:
let
  cfg = config.nixos;
in
{
  options.nixos = {

    devices = lib.mkOption {
      type = lib.types.attrsOf lib.types.raw;
      default = { };
      description = ''
        Device-specific NixOS configurations. Each attribute name becomes a
        `nixosConfigurations.<name>` output, with a corresponding
        `checks.<system>.<name> topLevel` check.
      '';
      example = lib.literalExpression ''
        {
          my-laptop.imports = [
            ./devices/my-laptop/configuration.nix
          ];
          my-server.imports = [
            ./devices/my-server/configuration.nix
          ];
        }
      '';
    };

    sharedModules = lib.mkOption {
      type = lib.types.listOf lib.types.raw;
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
              inherit inputs funkcia-utils;
            };

            modules = cfg.sharedModules ++ [ value ];
          };

          checks.x86_64-linux."${name} topLevel" =
            self.nixosConfigurations.${name}.config.system.build.toplevel;
        }
      ))

      (lib.foldl lib.recursiveUpdate { })
    ];
  };
}
