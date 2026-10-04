{
  config,
  lib,
  ...
}:
{
  options.funkcia.hm.avatar = lib.mkOption {
    default = null;
    type = lib.types.nullOr lib.types.path;
    description = "path of your avatar";
  };

  config = lib.mkIf (config.funkcia.hm.avatar != null) {
    home.file.".face".source = config.funkcia.hm.avatar;
  };
}
