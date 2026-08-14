{ pkgs, funkcia-utils, ... }: {
  nix.settings.trusted-users = [ "linca" ];

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.linca = {
    isNormalUser = true;
    description = "linca";
    extraGroups = [
      "wheel"
      "docker"
    ];
    shell = pkgs.fish;
    initialPassword = "change-this-password-after-login";
  };

  home-manager.users.linca = {
    imports = [
      (funkcia-utils.projectPath /home/linca/home.nix)
      ./home.nix
    ];
    home.stateVersion = "26.05";
  };

  services.openssh.settings.AllowUsers = [ "linca" ];
}
