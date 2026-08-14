{
  lib,
  ...
}:
{
  options.funkcia.os.preset = lib.mkOption {
    type = lib.types.nullOr (
      lib.types.enum [
        "pc"
        "server"
      ]
    );

    description = "preset of os config";
  };
}
