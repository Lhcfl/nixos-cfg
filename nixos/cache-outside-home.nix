{
  this,
  lib,
  options,
  ...
}:
{
  this.options = lib.mkOption {
    type = lib.types.attrsOf (
      lib.types.submodule {
        options.enable = lib.mkEnableOption "put cache files outside $HOME, so home backup wouldn't back cache";
      }
    );
  };

  config =
    let
      forEnabledUsers = mapper: f: mapper f (lib.filterAttrs (_: v: v.enable) this.config);
    in
    if (options ? home-manager) then
      {
        systemd.tmpfiles.settings.funkcia-general-cache = forEnabledUsers lib.mapAttrs' (
          name: _: {
            name = "/var/cache/${name}";
            value.d = {
              mode = "0700";
              user = name;
            };
          }
        );

        home-manager.users = forEnabledUsers lib.mapAttrs (
          name: settings:
          let
            dir = "/var/cache/${name}";
          in
          { config, ... }: {
            xdg.cacheHome = dir;

            # 防不遵守 XDG 规范的软件
            home.file.".cache" = {
              source = config.lib.file.mkOutOfStoreSymlink dir;
            };
          }
        );
      }
    else
      {
        assertions = [
          {
            assertion = forEnabledUsers (x: y: x == y) { };
            message = "you can't enable `funkcia.cache-outside-home` without home-manager enabled";
          }
        ];
      };
}
