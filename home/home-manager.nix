{
  inputs,
  funkcia-utils,
  ...
}:
{
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;

    # home manager use 'extraSpecialArgs'
    extraSpecialArgs = {
      inherit inputs funkcia-utils;
    };

    sharedModules = [
      inputs.plum-nix.homeModules.default
      inputs.sops-nix.homeManagerModules.sops
      inputs.self.homeModules.default
    ];

    backupFileExtension = "hm.old";
  };
}
