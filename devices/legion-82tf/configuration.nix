{
  pkgs,
  lib,
  funkcia-utils,
  ...
}:
{
  imports = builtins.concatLists [
    [ ./hardware-configuration.nix ]
    (builtins.filter (lib.hasSuffix "os.nix") (funkcia-utils.files.listNixFilesRec ./users))
  ];

  networking.hostName = "legion-82tf"; # Define your hostname.

  funkcia.os = {
    preset = "pc";

    gui.hyprland.enable = true;

    fingerprint = {
      enable = true;
      todDriver = pkgs.libfprint-2-tod1-elan;
    };

    btrbk.enable = true;

    laptop.enable = true;

    networking.proxy = "http://127.0.0.1:10808";
  };

  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
    open = true;
    nvidiaSettings = true;
  };

  boot.loader.systemd-boot.configurationLimit = 10;
  boot.loader.systemd-boot.sortKey = "wa"; # after auto windows
  # Whether the installation process is allowed to modify EFI boot variables.
  boot.loader.efi.canTouchEfiVariables = true;

  nix.settings.trusted-users = [
    "root"
    "linca"
  ];

  services.cloudflared.enable = true;
  environment.systemPackages = with pkgs; [ cloudflared ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.11"; # Did you read the comment?+
}
