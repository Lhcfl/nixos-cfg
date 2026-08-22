{
  lib,
  config,
  ...
}:
{
  config = lib.mkIf (config.funkcia.os.preset == "server") {
    # todo
  };
}
