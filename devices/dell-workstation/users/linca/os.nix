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
  };

  home-manager.users.linca = {
    imports = [
      (funkcia-utils.projectPath /home/linca/home.nix)
      ./home.nix
    ];
    home.stateVersion = "26.05";
  };
}
