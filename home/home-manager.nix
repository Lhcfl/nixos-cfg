{ inputs, ... }:
{
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    # i don't know why, but home manager needs extraSpecialArgs
    extraSpecialArgs = {
      inherit inputs;
    };
    users.linca = ./linca/home.nix;
    backupFileExtension = ".hm.old";
  };
}
