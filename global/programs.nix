{ pkgs, ... }:
{
  programs = {

    # nix-ld helps you to run non-nix executables in a nix environment
    # https://nix.dev/guides/faq#how-to-run-non-nix-executables
    nix-ld = {
      enable = true;
      # libraries = with pkgs; [ ];
    };
    hyprland.enable = true;
    waybar.enable = true;
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    neovim
    eza
    fd
    ripgrep
    zoxide
    helix
    firefox
    fzf
    kitty
    git
    bat
    bun
    sbctl
    lon
    v2rayn
    xray
    brightnessctl
    playerctl
    unzip
    p7zip
    libnotify
  ];

  fonts.packages = with pkgs; [
    maple-mono.NF-CN-unhinted
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    noto-fonts-color-emoji
  ];

}
