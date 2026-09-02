{
  pkgs,
  funkcia-utils,
  ...
}:
{
  imports = [
    ./hardware-configuration.nix
    ./packages.nix
    (funkcia-utils.files.mkDirModule ./services)
    (funkcia-utils.files.mkDirModule ./users)
  ];

  networking.hostName = "dell-workstation"; # Define your hostname.

  funkcia.os = {
    preset = "pc";
    networking.proxy = "http://127.0.0.1:10808";
  };

  boot.loader.systemd-boot.configurationLimit = 50;
  boot.loader.systemd-boot.sortKey = "wa"; # after auto windows
  # Whether the installation process is allowed to modify EFI boot variables.
  boot.loader.efi.canTouchEfiVariables = true;

  nix.settings.trusted-users = [
    "root"
    "linca"
  ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "26.11"; # Did you read the comment?+
}
