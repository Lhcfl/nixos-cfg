{
  inputs,
  funkcia-utils,
  self,
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
      self.homeModules.shared
      self.homeModules.default
    ];

    backupFileExtension = "hm.old";
  };
}
