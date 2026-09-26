{
  pkgs,
  lib,
  this,
  ...
}:
{
  this.options.enable = lib.mkEnableOption "root 用户相关设置";

  config = lib.mkIf this.config.enable {
    nix.settings.trusted-users = [ "root" ];
    users.users.root = {
      shell = pkgs.zsh;
    };
  };
}
