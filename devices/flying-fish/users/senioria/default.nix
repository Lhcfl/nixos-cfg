{ pkgs, ... }: {
  funkcia.os.user.senioria = {
    is-admin = true;
    ssh-login.enable = true;
  };

  users.users.senioria = {
    shell = pkgs.fish;
    openssh.authorizedKeys.keys = [ ];
  };

  home-manager.users.senioria = {
    imports = [
      ./home.nix
    ];
    home.stateVersion = "26.05";
  };
}
