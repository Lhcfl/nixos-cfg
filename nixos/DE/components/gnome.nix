{
  this,
  lib,
  ...
}:
{
  this.options = {
    enable = lib.mkEnableOption "GNOME components (NixOS Module)";
  };

  config = lib.mkIf this.config.enable {
    services.gvfs.enable = true;
  };
}
