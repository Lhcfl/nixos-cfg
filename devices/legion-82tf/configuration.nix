# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{ pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
  ];

  funkcia.os = {
    fingerprint.enable = true;
    docker.enable = true;
    secure-boot.enable = true;
    btrbk.enable = true;
    tpm.enable = true;
    nix-mirrors.enable = true;
    laptop.enable = true;
    gui = {
      enable = true;
      niri.enable = true;
      hyprland.enable = true;
    };
    # ly.enable = true;
    # winslow-cloud.enable = true;
    sddm.enable = true;
    sddm.theme.name = "pixel_sakura";
  };

  services.displayManager.sddm.settings = {
    General = {
      GreeterEnvironment = "QT_WAYLAND_SHELL_INTEGRATION=layer-shell,QT_SCALE_FACTOR=1.5";
    };
  };

  programs.steam.enable = true;
  # security.pam.services.ly.fprintAuth = false;

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
    open = true;
    nvidiaSettings = true;
  };

  networking.hostName = "legion-82tf"; # Define your hostname.

  boot.loader.systemd-boot.configurationLimit = 10;
  boot.loader.systemd-boot.sortKey = "wa"; # after auto windows

  nix.settings.trusted-users = [
    "root"
    "linca"
  ];

  services.cloudflared.enable = true;
  environment.systemPackages = with pkgs; [ cloudflared ];

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
  home-manager.users.linca.home.stateVersion = "26.05";
}
