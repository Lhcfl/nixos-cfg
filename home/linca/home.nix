{
  utils,
  osConfig,
  pkgs,
  ...
}:
{
  funkcia.hm = {
    gui.enable = osConfig.funkcia.os.gui.enable;
    wine.enable = true;
    language-sdk = {
      cpp.enable = true;
      javascript.enable = true;
      nix.enable = true;
      python.enable = true;
    };
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

  home.packages = with pkgs; [
    tree-sitter
    vscode-json-languageserver
    tombi # toml LSP
    go-musicfox # music
    fastfetch # system info
    devenv
    ast-grep
    typst
    gh
    openssl
    dotenv-cli
  ];

  imports = [
    ./gui.nix
    ./xdg.nix
    ./ricing.nix
  ]
  ++ utils.files.listNixFiles ./programs;
}
