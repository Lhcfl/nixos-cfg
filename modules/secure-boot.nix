# Module for enabling Secure Boot with lanzaboote and sbctl.
# Please refer to https://nix-community.github.io/lanzaboote/getting-started/prepare-your-system.html
# first, sudo sbctl create-keys,
# then evaluate and apply this module.
# finally sudo sbctl enroll-keys to enroll the keys into your firmware.

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
