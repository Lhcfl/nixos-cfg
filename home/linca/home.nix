{
  lib,
  utils,
  ...
}:
{
  funkcia.hm.gui.enable = lib.mkDefault true;
  funkcia.hm.wine.enable = lib.mkDefault true;

  programs.home-manager.enable = true;

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

    sessionVariables = {
      EDITOR = "hx";
      VISUAL = "nvim";
    };
  };

  imports = [
    ./packages.nix
    ./dotfiles.nix
    ./shell.nix
    ./gui.nix
    ./xdg.nix
    ./ricing.nix
    ./wine.nix
  ]
  ++ utils.files.listNixFilesRec ./programs;
}
