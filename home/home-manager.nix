{
  inputs,
  lib,
  ...
}:
let
  utils = {
    files = import ../utils/files.nix { inherit lib; };
    magic = import ../utils/magic.nix { inherit lib; };
  };
in
{
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;

    # home manager use 'extraSpecialArgs'
    extraSpecialArgs = {
      inherit inputs utils;
    };

    sharedModules = [
      inputs.nix-index-database.homeModules.default
      inputs.plum-nix.homeModules.default
      inputs.sops-nix.homeManagerModules.sops
    ]
    ++ (utils.files.listNixFilesRec ./modules);

    users.linca = ./linca/home.nix;

    backupFileExtension = "hm.old";
  };
}
