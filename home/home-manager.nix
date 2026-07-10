{ inputs, pkgs, ... }:
let
  utils = {
    files = import ../utils/files.nix { nixpkgs = pkgs; };
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
      inputs.noctalia.homeModules.default
      inputs.plum-nix.homeModules.default
    ]
    ++ (utils.files.listNixFilesRec ./modules);

    users.linca = _: {
      imports = [ ./linca/home.nix ];
      home.stateVersion = "26.05";
    };

    backupFileExtension = "hm.old";
  };
}
