{ pkgs, funkcia-utils, ... }: {
  nix.settings.trusted-users = [ "linca" ];

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

    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJwHaPGjtqvGsYrO5NiGHoVMSS/Qj+63hv1QNBG+wnm+ linca@nixos"
    ];
  };

  services.openssh.settings.AllowUsers = [ "linca" ];

  home-manager.users.linca = {
    imports = [
      (funkcia-utils.projectPath /home/linca/home.nix)
      ./home.nix
    ];
    home.stateVersion = "26.05";
  };
}
