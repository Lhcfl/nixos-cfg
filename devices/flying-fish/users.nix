{ pkgs, ... }: {
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.test = {
    isNormalUser = true;
    description = "test user";
    extraGroups = [
      "networkmanager"
      "wheel"
      "docker"
    ];
    shell = pkgs.zsh;
    initialPassword = "testpassword";
  };

  services.openssh.settings.AllowUsers = [ "test" ];
}
