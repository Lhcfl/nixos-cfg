{

  lib,
  ...
}:
{
  options.funkcia.os.new-cn-install = lib.mkEnableOption ''
    New CN installation mode, where some packages that require github network access
    will be delayed
  '';
}
