{ pkgs, ... }:
{
  # Some programs need SUID wrappers, can be configured further or are
  programs = {
    # allow appimage
    appimage = {
      enable = true;
      binfmt = true;
    };

    # nix-ld helps you to run non-nix executables in a nix environment
    # https://nix.dev/guides/faq#how-to-run-non-nix-executables
    nix-ld = {
      enable = true;
      # libraries = with pkgs; [ ];
    };

    # traceroute and ping
    mtr.enable = true;

    #gunpg
    gnupg.agent = {
      enable = true;
      enableSSHSupport = false; # ssh agent
    };

    # better shell
    fish.enable = true;
  };

  # system wide packages.
  # to search run `nix search wget`
  environment.systemPackages = with pkgs; [
    wget
    neovim
    eza # `ls` replacement
    fd # `find` replacement
    ripgrep # `grep` replacement
    zoxide # `cd` replacement
    helix # `vim` replacement
    firefox
    fzf # fuzzy finder
    kitty # terminal emulator
    git
    bat # `cat` replacement
    bun # js runtime
    lon # nix package manager
    v2rayn # proxy client
    xray # proxy client
    brightnessctl # brightness control
    playerctl # media player control
    unzip
    p7zip # 7z
    libnotify # notification support
    manix # nix configuration helper
    gdu # better `du`
    btop # better htop
    htop
  ];

}
