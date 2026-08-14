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
      inputs.nix-index-database.homeModules.default
      inputs.plum-nix.homeModules.default
      inputs.sops-nix.homeManagerModules.sops
      inputs.self.homeModules.default
    ];

    users.linca = ./linca/home.nix;

    backupFileExtension = "hm.old";
  };
}
