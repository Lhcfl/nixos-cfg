{ pkgs, ... }: {
  nix.settings.trusted-users = [ "root" ];
  users.users.root = {
    shell = pkgs.zsh;
  };
}
