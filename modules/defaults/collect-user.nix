{
  lib,
  config,
  ...
}:
{
  config.systemd.tmpfiles.settings.funkcia-users = lib.pipe config.home-manager.users [
    (lib.attrsets.filterAttrs (name: value: value.funkcia.avatar != null))
    (lib.attrsets.mapAttrs' (
      name: user: {
        name = "/var/lib/AccountsService/icons/${name}";
        value."L+" = {
          mode = "0444";
          argument = toString user.funkcia.avatar;
        };
      }
    ))
  ];
}
