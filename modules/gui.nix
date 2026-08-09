{
  lib,
  ...
}:
{
  options.funkcia.os.gui = {
    enable = lib.mkEnableOption "GUI related options";
  };
}
