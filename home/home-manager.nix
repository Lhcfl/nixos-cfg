_: {
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.linca = ./linca/home.nix;
    backupFileExtension = ".hm.old";
  };
}
