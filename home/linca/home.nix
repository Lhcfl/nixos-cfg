{
  funkcia-utils,
  pkgs,
  ...
}:
{
  programs.home-manager.enable = true;

  funkcia.hm.avatar = ./assets/avatar-trans.png;
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
    fastfetch # system info
    dotenv-cli # load .env
  ];

  xdg.configFile.funkcia-dotfiles = {
    target = ".";
    source = ./xdg/config;
    recursive = true;
  };

  imports = [
    (funkcia-utils.files.mkDirModule ./programs)
    (funkcia-utils.files.mkRecDirModule ./gui)
    (funkcia-utils.files.mkRecDirModule ./modules)
  ];
}
