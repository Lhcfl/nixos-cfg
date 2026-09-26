{
  lib,
  this,
  ...
}:
{
  this.options.enable = lib.mkEnableOption "安全相关设置";

  config = lib.mkIf this.config.enable {
    security = {
      sudo-rs = {
        enable = true;
        execWheelOnly = true;
      };

      polkit = {
        enable = true;
        enablePkexecWrapper = true; # without this, pkexec will report "setuid must be root"
      };

      auditd.enable = true;
    };
  };
}
