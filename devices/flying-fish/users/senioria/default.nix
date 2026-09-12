{ pkgs, ... }: {
  funkcia.os.user.senioria = {
    is-admin = true;
    ssh-login.enable = true;
  };

  users.users.senioria = {
    shell = pkgs.fish;
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILbBUHBnQMnKUpWMS5bM5mXYOu9ilTjo41y6W2AklDxk senioria@mail.stelpolva.moe"
    ];
  };

  home-manager.users.senioria = {
    imports = [
      ./home.nix
    ];
    home.stateVersion = "26.05";
  };
}
