{ inputs, ... }:
{
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    # i don't know why, but home manager needs extraSpecialArgs
    extraSpecialArgs = {
      inherit inputs;
    };
    users.linca = _: {
      imports = [ ./linca/home.nix ];
      home.stateVersion = "26.05";
    };
    backupFileExtension = ".hm.old";
  };
}
