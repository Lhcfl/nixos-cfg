{ pkgs, funkcia-utils, ... }: {
  funkcia.os.user.linca = {
    is-admin = true;
    ssh-login.enable = true;
  };

  users.users.linca = {
    shell = pkgs.fish;
    openssh.authorizedKeys.keys = [
      "ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBDN5f2O8JFC9MsGjl5OyIkMjryLyQ5hqaxogJ/ObYQR29EOnpcZ0Ap/UBKmHJQlrLZbMy8uQM4fG4YD4+IbtalI="
    ];
  };

  home-manager.users.linca = {
    imports = [
      (funkcia-utils.projectPath /home/linca/home.nix)
      ./home.nix
    ];
    home.stateVersion = "26.05";
  };
}
