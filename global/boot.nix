{ pkgs, ... }: {
  boot = {
    loader.systemd-boot.enable = true;

    # Whether the installation process is allowed to modify EFI boot variables.
    loader.efi.canTouchEfiVariables = true;
    
    # Use latest kernel.
    kernelPackages = pkgs.linuxPackages_latest;

    # ? maybe a error i don't know
    bootspec.enable = true;
  };
}