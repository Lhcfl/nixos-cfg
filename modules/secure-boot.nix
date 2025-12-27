{ pkgs, lib, ... }:
{
  environment.systemPackages = with pkgs; [
    sbctl
  ];

  # Bootloader.
  boot = {
    # lanzaboot will replace systemd-boot. so we disable it.
    loader.systemd-boot.enable = lib.mkForce false;

    loader.efi.canTouchEfiVariables = true;

    bootspec.enable = true;

    lanzaboote = {
      enable = true;
      pkiBundle = "/var/lib/sbctl";
    };

    # Use latest kernel.
    kernelPackages = pkgs.linuxPackages_latest;
  };
}
