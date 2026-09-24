{
  pkgs,
  lib,
  config,
  ...
}:
let
  cfg = config.funkcia.os.system;
in
{
  options.funkcia.os.system = {
    bbr.enable =
      lib.mkEnableOption ''
        replace CUBIC with BBR.
        用 Google BBR 替代默认 CUBIC, 高延迟/丢包网络下吞吐更高、延迟更低，国内网络改善明显。
      ''
      // {
        default = true;
      };

  };

  config = lib.mkMerge [
    {
      # use latest kernel package
      boot.kernelPackages = pkgs.linuxPackages_latest;
      # 启用 SysRq 全部功能，卡死时可用 Alt+SysRq 组合键抢救
      boot.kernel.sysctl."kernel.sysrq" = 1;
      # zswap 是一个内核功能，它为交换页提供了一个压缩的内存缓存。
      boot.zswap.enable = true;

      # OOM Killer
      systemd.oomd = {
        enable = true;
        enableRootSlice = true;
        enableSystemSlice = true;
        enableUserSlices = true;
      };
    }

    (lib.mkIf cfg.bbr.enable {
      boot.kernel.sysctl."net.ipv4.tcp_congestion_control" = "bbr";
      boot.kernel.sysctl."net.core.default_qdisc" = "fq";
      boot.kernelModules = [ "tcp_bbr" ];
    })
  ];
}
