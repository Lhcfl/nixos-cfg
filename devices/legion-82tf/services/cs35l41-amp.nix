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
# 关键点：**不要单独 unbind/bind 某一路功放**（i2c 设备）。
# 单独重绑会与仍占用的 codec 抢同一个 IRQ，触发
#     genirq: Flags mismatch ... cs35l41 IRQ1 Controller
#     cs35l41-hda.1: IRQ Config Failed ... not recoverable without reboot
# 反而把另一路也弄哑。
#
# 正确且安全的做法是**重载整块 SOF 声卡 PCI 设备**：
#     /sys/bus/pci/drivers/sof-audio-pci-intel-tgl/{unbind,bind}
# 这会完整拆除并重新探测 HDA codec 与两颗功放，干净地释放并重建 IRQ，
# 左右功放都会重新加载固件（日志出现 "Firmware Loaded ... FW EN: 1"）。
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
  config,
  lib,
  pkgs,
  ...
}:
let
  # CS35L41 功放的 i2c 驱动目录（存在则说明是本机此类硬件）。
  i2cDriver = "/sys/bus/i2c/drivers/cs35l41-hda";
  # Intel Alder Lake SOF HDA 声卡 PCI 驱动目录。
  pciDriver = "/sys/bus/pci/drivers/sof-audio-pci-intel-tgl";
  # 用户会话内 systemctl 的绝对路径（用于唤醒后重启 WirePlumber）。
  systemctl = "${config.systemd.package}/bin/systemctl";

  # 功放初始化 / 恢复失败的“原因”片段（脚本按声道前缀 cs35l41-hda.<ch>: 匹配）。
  failAlt = lib.concatStringsSep "|" [
    "Cannot Initialize Firmware"
    "Cannot Run Firmware"
    "Failed waiting for OTP_BOOT_DONE"
    "Failed to read SCRATCH0"
    "IRQ Config Failed"
    "cs35l41_system_resume.*returns -121"
  ];

  fixup = pkgs.writeShellApplication {
    name = "cs35l41-amp-fixup";
    runtimeInputs = with pkgs; [
      systemd
      coreutils
      gnugrep
      util-linux
    ];
    # 显式排除易在 `set -e` 场景误报的检查，避免构建期 shellcheck 失败。
    excludeShellChecks = [
      "SC2310"
      "SC2312"
      "SC2317"
    ];
    text = ''
      log() { echo "cs35l41-amp-fixup: $*"; }

      # 需要修复吗？逐个声道取“最后一次失败”与“最后一次固件加载成功”的行号：
      # 若某声道最后一次失败晚于最后一次成功（或从未成功），则判定需要修复。
      # 参数原样透传给 journalctl（如 -b，或 --since "@<epoch>"）。
      # 这样可避免因日志里存在“历史失败但后来已恢复”而误触发。
      needs_fix() {
        local klog
        local ch
        local last_fail
        local last_ok
        klog="$(journalctl -k "$@" --no-pager 2>/dev/null || true)"
        for ch in 0 1; do
          last_fail="$(printf '%s\n' "$klog" | grep -nE "cs35l41-hda[.]$ch:.*(${failAlt})" | tail -1 | cut -d: -f1 || true)"
          last_ok="$(printf '%s\n' "$klog" | grep -nE "cs35l41-hda[.]$ch:.*Firmware Loaded" | tail -1 | cut -d: -f1 || true)"
          if [ -n "$last_fail" ]; then
            if [ -z "$last_ok" ] || [ "$last_fail" -gt "$last_ok" ]; then
              return 0
            fi
          fi
        done
        return 1
      }

      # 找出绑定在 SOF 驱动上的声卡 PCI 地址（形如 0000:00:1f.3）。
      find_card() {
        local dev
        for dev in "${pciDriver}"/*; do
          dev="$(basename "$dev")"
          case "$dev" in
            0000:*) printf '%s' "$dev"; return 0 ;;
          esac
        done
        return 1
      }

      # 重载整块声卡（安全做法，避免单功放 rebind 的 IRQ 冲突）。
      reload_card() {
        local dev
        dev="$(find_card)" || { log "no SOF HDA card bound to ${pciDriver}"; return 1; }
        log "reloading SOF HDA card $dev"
        printf '%s' "$dev" > "${pciDriver}/unbind" || return 1
        sleep 2
        printf '%s' "$dev" > "${pciDriver}/bind" || return 1
        sleep 3
      }

      # 让每个已登录用户会话的 WirePlumber 重新识别重建后的声卡。
      restart_user_audio() {
        local uid
        local user
        while read -r uid _; do
          [ -n "$uid" ] || continue
          user="$(id -un "$uid" 2>/dev/null)" || continue
          runuser -u "$user" -- env XDG_RUNTIME_DIR="/run/user/$uid" \
            "${systemctl}" --user restart wireplumber.service 2>/dev/null || true
        done < <(loginctl list-users --no-legend 2>/dev/null)
      }

      main() {
        # 无该硬件则空跑退出（本模块为全局共享模块）。
        if [ ! -d "${i2cDriver}" ]; then
          log "no CS35L41 amp on this host, nothing to do"
          return 0
        fi

        # 等声卡/功放探测日志落盘。
        sleep 2

        if ! needs_fix -b; then
          log "no CS35L41 init failure detected"
          return 0
        fi

        log "detected CS35L41 init failure, recovering"
        local start
        start="$(date +%s)"

        if ! reload_card; then
          log "sound card reload failed"
          return 1
        fi
        sleep 2
        restart_user_audio || true

        if needs_fix --since "@$start"; then
          log "amps still failing after reload"
          return 1
        fi
        log "recovery complete, speaker amps re-initialized"
      }

      main "$@"
    '';
  };
in
{
  # 开机后自愈。
  systemd.services.cs35l41-amp-fixup = {
    description = "Re-initialize CS35L41 speaker amps if firmware load failed";
    after = [ "sound.target" ];
    wantedBy = [ "multi-user.target" ];
    serviceConfig = {
      Type = "oneshot";
      ExecStart = "${fixup}/bin/cs35l41-amp-fixup";
      RemainAfterExit = false;
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
    serviceConfig = {
      Type = "oneshot";
      ExecStart = "${fixup}/bin/cs35l41-amp-fixup";
      RemainAfterExit = false;
    };
  };
}
