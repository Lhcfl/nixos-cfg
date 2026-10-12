{
  inputs,
  pkgs,
  ...
}:
{
  programs.home-manager.enable = true;

  funkcia.hm.avatar = ./assets/avatar-trans.png;
  funkcia.hm.modern-cli-tools.enable = true;
  funkcia.hm.flatpak = {
    enable = true;
    mountNixStore = true;
  };

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

  xdg.enable = true;

  xdg.configFile.funkcia-dotfiles = {
    target = ".";
    source = ./xdg/config;
    recursive = true;
  };

  imports = map (x: inputs.filesystem-modules.mkModule { directory = x; }) [
    ./programs
    ./modules
    ./gui
  ];
}
