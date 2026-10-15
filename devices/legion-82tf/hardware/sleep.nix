{ ... }: {
  # 显式使用 S3 (deep) 挂起，而不是固件默认的 s2idle (S0ix)。
  #
  # 注：曾把「合盖放包里发热」归咎于 s2idle 压不住功耗，这个判断是错的。
  # 真正的根因是 noctalia 锁屏 bug：熄屏后再触发锁定会把屏幕重新点亮，
  # 锁屏持续重绘、白烧 CPU/GPU（noctalia issue #4843，已在 5.3.0 修复）。
  boot.kernelParams = [ "mem_sleep_default=deep" ];
}
