{
  lib,
  this,
  pkgs,
  ...
}:
{
  this.options = {
    enable = lib.mkEnableOption "全局安全相关设置";
    replacePkexec = lib.mkEnableOption "replace pkexec with run0-pkexec-wrapper" // {
      default = true;
    };
  };

  config = lib.mkIf this.config.enable (
    lib.mkMerge [
      {
        security.sudo-rs = {
          enable = true;
          execWheelOnly = true;
        };

        security.polkit = {
          enable = true;
          enablePkexecWrapper = lib.mkDefault true;
        };
      }

      (lib.mkIf this.config.replacePkexec {
        # without this, pkexec will report "setuid must be root"
        # but we will replace it with run0-pkexec-wrapper
        security.polkit.enablePkexecWrapper = false;

        environment.systemPackages = [
          pkgs.funkcia.run0-pkexec-wrapper
        ];
      })
    ]
  );
}
