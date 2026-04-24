{ inputs, pkgs, ... }:
{
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    # i don't know why, but home manager needs extraSpecialArgs
    extraSpecialArgs = {
      inherit inputs;
      utils = {
        files = pkgs.callPackage ../utils/files.nix { nixpkgs = pkgs; };
        fp = pkgs.callPackage ../utils/fp.nix { };
      };
    };
    users.linca = _: {
      imports = [ ./linca/home.nix ];
      home.stateVersion = "26.05";
    };
    backupFileExtension = ".hm.old";
  };
}
