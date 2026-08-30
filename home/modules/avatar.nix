{
  config,
  lib,
  ...
}:
{
  options.funkcia.avatar = lib.mkOption {
    default = null;
    type = lib.types.nullOr lib.types.path;
    description = "path of your avatar";
  };

  config = lib.mkIf (config.funkcia.avatar != null) {
    home.file.".face".source = config.funkcia.avatar;
  };
}
