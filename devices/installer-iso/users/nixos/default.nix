{ pkgs, lib, ... }: {
  users.users.nixos = {
    shell = pkgs.fish;
  };

  home-manager.users.nixos = { config, ... }: {
    imports = [ ./home.nix ];

    home.stateVersion = lib.mkDefault config.home.version.release;
  };
}
