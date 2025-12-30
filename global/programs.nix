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

    # use default ssh agent
    ssh.startAgent = true;
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
    fzf # fuzzy finder
    git
    bat # `cat` replacement
    bun # js runtime
    lon # nix package manager
    unzip
    p7zip # 7z
    manix # nix configuration helper
    gdu # better `du`
    btop # better htop
    htop

    ## GUI PACKAGES

    libnotify # notification support
    firefox
    kitty # terminal emulator
    v2rayn # proxy client
    xray # proxy client
    brightnessctl # brightness control
    playerctl # media player control
  ];

}
