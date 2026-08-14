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

    # use default ssh agent
    ssh.startAgent = true;

    neovim.enable = true;
  };

  # system wide packages.
  # to search run `nix search wget`
  environment.systemPackages =
    with pkgs;
    [
      wget
    ]
    ++ import ../slices/necessary-cli-tools.nix { inherit pkgs; };
}
