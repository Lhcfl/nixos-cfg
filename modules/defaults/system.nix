{ pkgs, ... }:
{
  # use latest kernel package
  boot.kernelPackages = pkgs.linuxPackages_latest;
  # 启用 SysRq 全部功能，卡死时可用 Alt+SysRq 组合键抢救
  boot.kernel.sysctl."kernel.sysrq" = 1;
  # zswap 是一个内核功能，它为交换页提供了一个压缩的内存缓存。
  boot.zswap.enable = true;
}
