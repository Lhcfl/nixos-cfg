_: {
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.linca = ./home/linca/home.nix;
    backupFileExtension = ".hm.old";
  };
}
