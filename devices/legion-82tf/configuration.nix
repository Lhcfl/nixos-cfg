# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{ pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
  ];

  funkcia.modules = {
    gnome-keyring.enable = true;
    fingerprint.enable = true;
    docker.enable = true;
    hyprland.enable = true;
    secure-boot.enable = true;
    btrbk.enable = true;
    tpm.enable = true;
    nix-mirrors.enable = true;
    laptop.enable = true;
    niri.enable = true;
  };

  programs.steam.enable = true;

  services.displayManager.ly = {
    settings = {
      animation = "dur_file";
      dur_file_path = toString (
        pkgs.fetchurl {
          url = "https://codeberg.org/attachments/f336d6ac-8331-4323-91fc-0e4619803401";
          hash = "sha256-fRm0wlkq9/GdLrVBOzMEnQG/i2ng+uGIzq0u9hu3m9g=";
        }
      );
      full_color = true;
    };
    enable = true;
  };
  security.pam.services.ly.fprintAuth = false;

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  networking.hostName = "nixos";

  boot.loader.systemd-boot.configurationLimit = 10;
  boot.loader.systemd-boot.sortKey = "wa"; # after auto windows

  nix.settings.trusted-users = [
    "root"
    "linca"
  ];

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.linca = {
    isNormalUser = true;
    description = "linca";
    extraGroups = [
      "networkmanager"
      "wheel"
      "docker"
      "tss" # tss group has access to TPM devices
    ];
    shell = pkgs.fish;
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.11"; # Did you read the comment?
}
