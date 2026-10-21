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
        # 不要启用 execWheelOnly：btrbk 以非 root 的 btrbk 用户运行，需要
        # exec sudo 来执行 btrfs 命令（nixpkgs 已为它生成 NOPASSWD 规则）。
        security.sudo-rs.enable = true;

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
