# Module for enabling Secure Boot with lanzaboote and sbctl.
# Please refer to https://nix-community.github.io/lanzaboote/getting-started/prepare-your-system.html

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
      
      # Keys are generated in a systemd service, so you will need to actually boot
      # the system to generate the keys. They will not be generated as part of 
      # switch-to-configuration or nixos-install.
      # https://nix-community.github.io/lanzaboote/how-to-guides/automatically-generate-keys.html
      autoGenerateKeys.enable = true;
      autoEnrollKeys.enable = true;
    };

    # Use latest kernel.
    kernelPackages = pkgs.linuxPackages_latest;
  };
}
