{
  funkcia-utils,
  pkgs,
  ...
}:
{
  programs.home-manager.enable = true;

  funkcia.avatar = ./assets/avatar-trans.png;
  funkcia.hm.modern-cli-tools.enable = true;

  home = {
    username = "linca";
    homeDirectory = "/home/linca";

    sessionPath = [
      "$HOME/.local/bin"
    ];

    sessionVariables = {
      EDITOR = "hx";
      VISUAL = "nvim";
    };

    shell.enableShellIntegration = true;
  };

  home.packages = with pkgs; [
    go-musicfox # music
    fastfetch # system info
    openssl
    dotenv-cli # load .env
  ];

  imports = [
    ./xdg.nix
    (funkcia-utils.files.mkDirModule ./programs)
    (funkcia-utils.files.mkRecDirModule ./modules)
  ];
}
