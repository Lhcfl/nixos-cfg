{ pkgs, ... }:
{
  # use latest kernel package
  boot.kernelPackages = pkgs.linuxPackages_latest;
  # 启用 SysRq 全部功能，卡死时可用 Alt+SysRq 组合键抢救
  boot.kernel.sysctl."kernel.sysrq" = 1;
}
