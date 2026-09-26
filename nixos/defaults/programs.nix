{ pkgs, ... }:
{
  # nix-ld helps you to run non-nix executables in a nix environment
  # https://nix.dev/guides/faq#how-to-run-non-nix-executables
  programs.nix-ld = {
    enable = true;
    # libraries = with pkgs; [ ];
  };

  # traceroute and ping
  programs.mtr.enable = true;

  #gunpg
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = false; # ssh agent
  };

  # use default ssh agent
  programs.ssh.startAgent = true;

  programs.neovim.enable = true;

  programs.nh.enable = true;

  programs.git.enable = true;

  environment.systemPackages = with pkgs; [
    wget
    bun # js runtime

    # 压缩文件
    zip
    unzip
    unar

    htop
    openssl
    jq
    funkcia.run0-gui
  ];
}
