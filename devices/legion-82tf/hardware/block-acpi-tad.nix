{ ... }: {
  # acpi_tad 的 ACPI _GRT（ACPI000E Time and Alarm Device）路径在本机固件
  # （BIOS JYCN58WW）上不返回，会让 rtc_timer_do_work 死循环并霸占 rtc0 的
  # ops_lock：一个核 100% 系统态，且访问 /dev/rtc 或 /sys/class/rtc/rtc0/*
  # 都会永久挂死。拉黑后由 rtc_cmos 接管成为 rtc0，读写时间与 wakealarm 都正常。
  boot.blacklistedKernelModules = [ "acpi_tad" ];
}
