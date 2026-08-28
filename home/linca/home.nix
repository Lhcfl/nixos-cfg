{
  funkcia-utils,
  pkgs,
  ...
}:
{
  programs.home-manager.enable = true;

  home = {
    username = "linca";
    homeDirectory = "/home/linca";

    file = {
      ".face" = {
        source = ./assets/avatar-trans.png;
      };
    };

    sessionPath = [
      "$HOME/.local/bin"
    ];

    sessionVariables = {
      EDITOR = "hx";
      VISUAL = "nvim";
    };

    shell.enableShellIntegration = true;
  };

  programs = {
    zoxide.enable = true;
    fish.enable = true;
    starship.enable = true;
    nushell.enable = true;
  };

  home.packages = with pkgs; [
    go-musicfox # music
    fastfetch # system info
    openssl
    dotenv-cli # load .env
  ];

  imports = [
    ./xdg.nix
    ./ricing.nix
    ./sops.nix
    (funkcia-utils.files.mkDirModule ./programs)
    (funkcia-utils.files.mkIndexDirModule "index.nix" ./programs)
    (funkcia-utils.files.mkRecDirModule ./modules)
  ];
}
