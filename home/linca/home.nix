{
  lib,
  utils,
  osConfig,
  ...
}:
{
  funkcia.hm.gui.enable = osConfig.funkcia.os.gui.enable;
  funkcia.hm.wine.enable = lib.mkDefault true;
  funkcia.hm.language-sdk = {
    cpp.enable = true;
    javascript.enable = true;
    nix.enable = true;
    python.enable = true;
  };

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
  ++ utils.files.listNixFiles ./programs;
}
