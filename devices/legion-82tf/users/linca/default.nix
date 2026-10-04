{ pkgs, funkcia-utils, ... }: {
  funkcia.os.user.linca = {
    is-admin = true;
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

  # 为什么安装在这里而不是 home manager
  # 因为这样才有 polkit policy
  environment.systemPackages = with pkgs; [
    bitwarden-desktop
  ];
}
