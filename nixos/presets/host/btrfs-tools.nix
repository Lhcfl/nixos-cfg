{
  config,
  lib,
  pkgs,
  this,
  ...
}:
let
  cond = lib.lists.any (x: x ? fsType && x.fsType == "btrfs") (
    builtins.attrValues config.fileSystems
  );
in
{
  this.options.enable = lib.mkEnableOption "btrfs tools";
  config = lib.mkIf this.config.enable {
    environment.systemPackages = lib.mkIf cond (
      with pkgs;
      [
        btdu
      ]
    );
  };
}
