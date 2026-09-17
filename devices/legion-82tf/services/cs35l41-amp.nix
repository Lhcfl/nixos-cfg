# =============================================================================
#  CS35L41 智能功放初始化失败自愈
# =============================================================================
#
# ── 背景（为什么会有这个 fix）─────────────────────────────────────────────
# 机型：Lenovo Legion Y9000X IAH7（82TF / LENOVO-82TF-...，SSID 17AA386E）。
# 左右声道各由一颗 Cirrus Logic CS35L41 智能功放驱动（I2C，挂在 HDA codec 上）：
#     cs35l41-hda.0  -> 左 (CH: L)
#     cs35l41-hda.1  -> 右 (CH: R)
#
# 症状：偶发单边（多为右侧）扬声器无声。内核日志会出现：
#     cs35l41-hda i2c-CSC3551:00-cs35l41-hda.1: Failed waiting for OTP_BOOT_DONE
#     cs35l41-hda i2c-CSC3551:00-cs35l41-hda.1: Cannot Initialize Firmware. Error: -16
#     cs35l41-hda ...: cs35l41_system_resume ... returns -121
#     cs35l41-hda ...: IRQ Config Failed. Amp errors may not be recoverable without reboot.
# 即功放在开机上电 / 休眠唤醒时没被正确初始化，导致该声道无声。
#
#
# ── 修复原理 ──────────────────────────────────────────────────────────────
# 故障分两类，判定与自愈逻辑都在同目录的 cs35l41-amp.nu（nushell）里。
#
#  soft（可恢复）：IRQ 冲突、resume -121、-16 等。关键点：**不要单独
#  unbind/bind 某一路功放**（i2c 设备）。单独重绑会与仍占用的 codec 抢同一个
#  IRQ，触发 `genirq: Flags mismatch ... cs35l41 IRQ1 Controller`，反而把另一路
#  也弄哑。正确且安全的做法是**重载整块 SOF 声卡 PCI 设备**：
#      /sys/bus/pci/drivers/sof-audio-pci-intel-tgl/{unbind,bind}
#  这会完整拆除并重新探测 HDA codec 与两颗功放，干净地释放并重建 IRQ，左右功放
#  都会重新加载固件（日志出现 "Firmware Loaded ... FW EN: 1"）。
#
#  hard（不可恢复）：功放本身 / 其 i2c 控制器卡死。日志表现为：
#      cs35l41-hda ...: Falling back to default firmware.
#      cs35l41-hda ...: Unable to find firmware and tuning
#      cs35l41-hda ...: Cannot Initialize Firmware. Error: -2
#  外加 PUP/PDN/SCRATCH 读取 -16(EBUSY)。此时重载声卡无效（声卡与功放的 i2c
#  控制器是两个独立 PCI 设备）。**不要尝试 unbind i2c 控制器**
#  （`i2c_designware.N`）——实测会让内核任务永久卡死在 D 状态，并挂起整次
#  `nh os switch`。这种状态只能靠重启（必要时关机冷启动）恢复，因此脚本只
#  记录日志并通过 notify-send 给已登录用户发桌面通知，不做任何破坏性操作。
#
# 本模块在以下时机检测并自愈：
#   1. 开机后（multi-user.target）：检查本次启动内核日志，发现失败才修复；
#   2. 休眠唤醒后：同上（挂起/唤醒是最容易触发该 bug 的场景）。
#
# 模块通过运行时判断 `/sys/bus/i2c/drivers/cs35l41-hda` 是否存在来决定是否生效，
# 因此在没有该功放的设备（dell-workstation / flying-fish）上会直接空跑退出。
#
#
# ── 相关命令（排查用）─────────────────────────────────────────────────────
# 手动触发一次自愈：
#     sudo systemctl start cs35l41-amp-fixup.service
# 查看结果：
#     journalctl -b -u cs35l41-amp-fixup.service
#     journalctl -k -b | grep cs35l41
# =============================================================================

{
  lib,
  pkgs,
  ...
}:
let
  # 自愈逻辑（nushell 脚本）在同目录的 cs35l41-amp.nu。
  fixup = pkgs.writers.writeNu "cs35l41-amp-fixup" {
    # 脚本用到的外部命令：journalctl/systemctl (systemd)、id/date (coreutils)、
    # runuser (util-linux)、notify-send (libnotify)；nushell 由 writeNu 作解释器。
    makeWrapperArgs = [
      "--prefix"
      "PATH"
      ":"
      (lib.makeBinPath [
        pkgs.systemd
        pkgs.coreutils
        pkgs.util-linux
        pkgs.libnotify
      ])
    ];
  } (builtins.readFile ./cs35l41-amp.nu);
in
{
  # 开机后自愈。
  systemd.services.cs35l41-amp-fixup = {
    description = "Re-initialize CS35L41 speaker amps if firmware load failed";
    after = [ "sound.target" ];
    wantedBy = [ "multi-user.target" ];
    # NixOS 约定：让 switch-to-configuration 跳过本单元（不因 rebuild/switch 而启停/重启），
    # 仅由 systemd 在开机（multi-user.target）时拉起。systemd 本身忽略该 X- 字段。
    unitConfig.X-OnlyManualStart = true;
    serviceConfig = {
      Type = "oneshot";
      ExecStart = "${fixup}";
      RemainAfterExit = false;
      # 防止任何情况下卡住调用方（如误在 switch 期间启动）。
      TimeoutStartSec = "60s";
    };
  };

  # 休眠/挂起唤醒后自愈（最易触发的场景）。
  systemd.services.cs35l41-amp-fixup-resume = {
    description = "Re-initialize CS35L41 speaker amps after resume";
    after = [
      "systemd-suspend.service"
      "systemd-hibernate.service"
      "systemd-hybrid-sleep.service"
    ];
    wantedBy = [
      "suspend.target"
      "hibernate.target"
      "hybrid-sleep.target"
    ];
    # 同上：switch 时跳过，仅在唤醒（suspend.target 等）时由 systemd 拉起。
    unitConfig.X-OnlyManualStart = true;
    serviceConfig = {
      Type = "oneshot";
      ExecStart = "${fixup}";
      RemainAfterExit = false;
      TimeoutStartSec = "60s";
    };
  };
}
