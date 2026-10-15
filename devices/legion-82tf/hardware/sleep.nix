{ ... }: {
  # 本机固件把“低功耗 S0 idle”（s2idle / S0ix 现代待机）当作默认的系统挂起
  # 方式（dmesg: "Low-power S0 idle used by default for system suspend"）。
  # 在这台 12 代 Intel + NVIDIA 的 Legion 上 s2idle 压不住功耗：合盖放进包里
  # 会持续发热。固件同时支持 S3（/sys/power/mem_sleep 里 deep 可用），这里
  # 强制改走 deep。
  boot.kernelParams = [ "mem_sleep_default=deep" ];

  # 合盖后不需要触摸板 / USB 唤醒。挂起期间它们会把机器反复唤醒
  # （本机曾观测到合盖后每 ~25s 醒一次、共 88 次的抖动），唤醒后 EC 重新上报
  # “合盖”又触发 logind 再次入睡，如此循环导致包里持续发热。
  # 只保留电源键与合盖事件作为唤醒源。
  services.udev.extraRules = ''
    # Synaptics I2C 触摸板 (CUST001:00 06CB:CE44)
    ACTION=="add", SUBSYSTEM=="i2c", KERNEL=="i2c-CUST001:00", ATTR{power/wakeup}="disabled"
    # 内部 USB 键盘 (ITE Device 8258)；合盖时盖子会压到键盘，是主要的误唤醒源
    ACTION=="add", SUBSYSTEM=="usb", ENV{DEVTYPE}=="usb_device", ATTRS{idVendor}=="048d", ATTRS{idProduct}=="c977", ATTR{power/wakeup}="disabled"
    # xHCI 控制器
    ACTION=="add", SUBSYSTEM=="pci", KERNEL=="0000:00:14.0", ATTR{power/wakeup}="disabled"
  '';
}
