{ ... }: {
  # 内核自带的 ideapad_laptop 会通过 VPC2004 ACPI 设备自动加载，并和
  # 外置的 legion_laptop 抢同一个 EC（PNP0C09:00）。7.2.6+ 上这条 ACPI/EC
  # 路径会偶发死锁（power_supply/udev 全部 D 状态卡死）。
  # Legion 的 EC/风扇/键盘由 legion_laptop 负责，所以拉黑内核自带的这个。
  boot.blacklistedKernelModules = [ "ideapad_laptop" ];
}
