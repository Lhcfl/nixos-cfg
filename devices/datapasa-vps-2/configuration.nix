# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  lib,
  funkcia-utils,
  ...
}:
{
  imports = builtins.concatLists [
    [
      ./disk-config.nix
      ./hardware-configuration.nix
      ./networking.nix
    ]
    (funkcia-utils.files.listNixFilesRec ./services)
    (builtins.filter (lib.hasSuffix "os.nix") (funkcia-utils.files.listNixFilesRec ./users))
  ];

  networking.hostName = "datapasa-vps-2"; # Define your hostname.

  funkcia.os = {
    fonts.enable = false;
  };

  boot.loader.grub = {
    enable = true;
    efiSupport = false;
  };

  networking.firewall.allowedTCPPorts = [
    22 # ssh
    80 # HTTP
    443 # HTTPS
  ];

  nix.settings.trusted-users = [
    "root"
    "@wheel"
  ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "26.11"; # Did you read the comment?
}
