{
  config,
  lib,
  pkgs,
  ...
}:
let
  cond = lib.lists.any (x: x ? fsType && x.fsType == "btrfs") (
    builtins.attrValues config.fileSystems
  );
in
{
  environment.systemPackages = lib.mkIf cond (
    with pkgs;
    [
      btdu
    ]
  );
}
