{
  inputs,
  funkcia-utils,
  self,
  ...
}:
{
  perSystem =
    {
      system,
      ...
    }:
    let
      nixos = inputs.nixpkgs.lib.nixosSystem {
        inherit system;

        specialArgs = {
          inherit inputs funkcia-utils self;
        };

        modules = [
          self.nixosModules.default
          inputs.home-manager.nixosModules.home-manager
          (funkcia-utils.projectPath /devices/installer-iso/configuration.nix)
          (funkcia-utils.projectPath /home/home-manager.nix)
        ];
      };
    in
    {
      packages.installer-iso = nixos.config.system.build.isoImage;
    };
}
