{
  lib,
  utils,
  osConfig,
  ...
}:
{
  funkcia.hm.gui.enable = lib.mkDefault true;

  home = {
    username = "linca";
    homeDirectory = "/home/linca";

    file = {
      ".face" = {
        source = ./assets/avatar.png;
      };
    };

    sessionPath = [
      "$HOME/.local/bin"
    ];
  };

  programs.home-manager.enable = true;

  imports = [
    ./packages.nix
    ./dotfiles.nix
    ./shell.nix
    ./environment.nix
    ./gui.nix
    ./xdg.nix
    ./ricing.nix
  ]
  ++ utils.files.listNixFiles ./programs;
}
