{
  lib,
  ...
}:
{
  options.funkcia.os.gui = {
    enable = lib.mkEnableOption "Enable GUI";
  };
}
