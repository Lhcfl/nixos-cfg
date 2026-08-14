{ pkgs, ... }: {
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.test = {
    isNormalUser = true;
    description = "test user";
    extraGroups = [
      "wheel"
      "docker"
    ];
    shell = pkgs.zsh;
    initialPassword = "testpassword";
  };

  services.openssh.settings.AllowUsers = [ "test" ];
}
