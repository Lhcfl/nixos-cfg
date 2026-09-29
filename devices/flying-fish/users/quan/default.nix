{ pkgs, ... }: {
  funkcia.os.user.quan = {
    ssh-login.enable = true;
  };

  users.users.quan = {
    shell = pkgs.fish;
    extraGroups = [ "docker" ];
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDrvwo6iLxjkjVp+1bLwYxPkX01AD2AVHal2Ik3NmB/u octo@octodora"
    ];
  };

  home-manager.users.quan = {
    imports = [ ./home.nix ];
    home.stateVersion = "26.05";
  };
}
