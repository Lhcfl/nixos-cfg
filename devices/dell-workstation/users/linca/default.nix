{ pkgs, funkcia-utils, ... }: {
  funkcia.os.user.linca = {
    is-admin = true;
    ssh-login.enable = true;
  };

  users.users.linca = {
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
