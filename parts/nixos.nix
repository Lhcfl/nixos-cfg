{
  self,
  inputs,
  lib,
  this,
  funkcia-utils,
  ...
}:
{
  this.options = {
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
        ]
      '';
    };
  };

  config.flake.nixosConfigurations = lib.mapAttrs (
    name: value:
    inputs.nixpkgs.lib.nixosSystem {
      specialArgs = {
        inherit inputs funkcia-utils self;
      };

      modules = this.config.sharedModules ++ [ value ];
    }
  ) this.config.devices;

  config.flake.checks.x86_64-linux = lib.mapAttrs' (name: value: {
    name = "${name} topLevel";
    value = self.nixosConfigurations.${name}.config.system.build.toplevel;
  }) this.config.devices;
}
