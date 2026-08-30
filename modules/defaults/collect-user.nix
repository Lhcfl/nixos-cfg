{
  lib,
  config,
  ...
}:
let
  eachHomeManagerUser =
    f:
    lib.pipe config.home-manager.users [
      (lib.attrsToList)
      (map f)
    ];
in
{
  config.systemd.tmpfiles.rules = builtins.filter (x: x != null) (
    eachHomeManagerUser (
      { name, value }:
      if (value.funkcia.avatar != null) then
        "L+ /var/lib/AccountsService/icons/${name} - - - - ${value.funkcia.avatar}"
      else
        null
    )
  );
}
