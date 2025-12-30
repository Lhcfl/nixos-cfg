_: {
  home = {
    username = "linca";
    homeDirectory = "/home/linca";
  };

  programs.home-manager.enable = true;

  imports = [
    ./packages.nix
    ./dotfiles.nix
    ./shell.nix
    ./environment.nix
    ./programs.nix
    ./gui.nix
  ];
}
