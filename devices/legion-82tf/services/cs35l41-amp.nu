# =============================================================================
#  CS35L41 功放初始化失败自愈（nushell 版）
# =============================================================================
#  由同目录的 cs35l41-amp.nix 通过 pkgs.writers.writeNu 打包成 cs35l41-amp-fixup。
#
#  失败分两类（由 classify 返回）：
#    soft  可重载整块 SOF HDA 声卡恢复（IRQ 冲突、resume -121 等）
#    hard  功放 / i2c 控制器卡死（Cannot Initialize Firmware: -2 等）。
#          重载声卡无效，且没有安全的用户态复位手段（unbind i2c 控制器会让
#          内核任务卡死在 D 状态），只能重启；此时发桌面通知提醒用户。
#
#  依赖的外部命令（由 nix 侧的 makeWrapperArgs 注入 PATH）：
#    journalctl / systemctl (systemd)、id / date (coreutils)、
#    runuser (util-linux)、notify-send (libnotify)。
# =============================================================================

const i2c_driver = "/sys/bus/i2c/drivers/cs35l41-hda"
const pci_driver = "/sys/bus/pci/drivers/sof-audio-pci-intel-tgl"

# 任一“失败原因”片段（按声道前缀 cs35l41-hda.<ch>: 匹配）。
const fail_alt = 'Cannot Initialize Firmware|Cannot Run Firmware|Failed waiting for OTP_BOOT_DONE|Failed to read SCRATCH0|IRQ Config Failed|cs35l41_system_resume.*returns -121'
# “硬故障”片段：功放 / i2c 卡死，重载声卡无法修复，只能重启。
const hard_fail = 'Unable to find firmware and tuning|Cannot Initialize Firmware[.] Error: -2'

def log [msg: string] { print $"cs35l41-amp-fixup: ($msg)" }

# 取内核日志行；args 原样透传给 journalctl（如 ["-b"] 或 ["--since" "@<epoch>"]）。
def klog [args: list<string>] {
  (^journalctl -k ...$args --no-pager | complete).stdout | lines
}

# 判断失败类型：逐个声道取“最后一次固件加载成功(Firmware Loaded)”之后的日志，
# 若其中仍有该声道的失败，则说明功放仍未恢复。返回 "hard" / "soft" / "none"。
# 用行号比较可避免把“历史失败但后来已恢复”误判为失败。
def classify [args: list<string>] {
  let kl = (klog $args)
  mut is_hard = false
  mut is_soft = false
  for ch in [0 1] {
    let ok_ids = ($kl | enumerate | where {|r| $r.item =~ $"cs35l41-hda[.]($ch):.*Firmware Loaded" } | get index)
    let region = (if ($ok_ids | is-empty) { $kl } else { $kl | skip (($ok_ids | last) + 1) })
    if not ($region | any {|l| $l =~ $"cs35l41-hda[.]($ch):.*($fail_alt)" }) { continue }
    $is_soft = true
    if ($region | any {|l| $l =~ $"cs35l41-hda[.]($ch):.*($hard_fail)" }) { $is_hard = true }
  }
  if $is_hard { "hard" } else if $is_soft { "soft" } else { "none" }
}

# 绑定在 SOF 驱动上的声卡 PCI 地址（形如 0000:00:1f.3）。
def find-card [] {
  let cards = (ls $pci_driver | get name | each {|p| $p | path basename } | where {|n| $n =~ '^0000:' })
  if ($cards | is-empty) { null } else { $cards | first }
}

# 重载整块声卡（安全做法，避免单功放 rebind 的 IRQ 冲突）。
def reload-card [] {
  let card = (find-card)
  if $card == null { log $"no SOF HDA card bound to ($pci_driver)"; return false }
  log $"reloading SOF HDA card ($card)"
  try {
    $card | save -f $"($pci_driver)/unbind"
    sleep 2sec
    $card | save -f $"($pci_driver)/bind"
    sleep 3sec
  } catch {|e| log $"sound card reload failed: ($e.msg)"; return false }
  true
}

# 当前有图形会话的用户 uid 列表（/run/user/<uid>）。
def user-uids [] {
  if not ("/run/user" | path exists) { [] } else {
    ls /run/user | get name | each {|p| $p | path basename } | where {|n| $n =~ '^[0-9]+$' }
  }
}

# 让每个已登录用户会话的 WirePlumber 重新识别重建后的声卡。
def restart-user-audio [] {
  for uid in (user-uids) {
    let user = ((^id -un $uid | complete).stdout | str trim)
    if ($user | is-empty) { continue }
    let _ = (^runuser -u $user -- env $"XDG_RUNTIME_DIR=/run/user/($uid)" systemctl --user restart wireplumber.service | complete)
  }
}

# 给每个已登录用户会话发桌面通知（notify-send）。
def notify [summary: string, body: string, urgency: string] {
  for uid in (user-uids) {
    let user = ((^id -un $uid | complete).stdout | str trim)
    if ($user | is-empty) { continue }
    let _ = (^runuser -u $user -- env $"XDG_RUNTIME_DIR=/run/user/($uid)" $"DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/($uid)/bus" notify-send --app-name=CS35L41 --urgency $urgency $summary $body | complete)
  }
}

def main [] {
  # 无该硬件则空跑退出（本模块为全局共享模块）。
  if not ($i2c_driver | path exists) {
    log "no CS35L41 amp on this host, nothing to do"
    exit 0
  }

  # 避免与正在进行的 suspend/resume 竞争：挂起会改动功放的电源 / 复位状态。
  let susp = (^systemctl is-active --quiet systemd-suspend.service | complete).exit_code
  if $susp == 0 {
    log "system is suspending, skipping"
    exit 0
  }

  # 等声卡 / 功放探测日志落盘。
  sleep 2sec

  let kind = (classify ["-b"])
  if $kind == "none" {
    log "no CS35L41 init failure detected"
    exit 0
  }

  if $kind == "hard" {
    # 硬故障不做任何破坏性操作：i2c 控制器卡死只能靠重启恢复。
    log "detected hard CS35L41 failure (amp/i2c bus wedged), a full reboot is required"
    notify "CS35L41 功放需要重启" "检测到功放 / i2c 总线卡死，扬声器可能无声；重载声卡无法恢复。请重启（或关机再开机）。" "critical"
    exit 1
  }

  log "detected recoverable CS35L41 init failure, reloading sound card"
  let start = (^date +%s | str trim)
  if not (reload-card) {
    log "sound card reload failed"
    notify "CS35L41 自愈失败" "重载声卡失败，扬声器可能无声。" "normal"
    exit 1
  }
  sleep 2sec
  restart-user-audio

  let after = (classify ["--since" $"@($start)"])
  if $after == "none" {
    log "recovery complete, speaker amps re-initialized"
    exit 0
  }
  log "amps still failing after reload"
  notify "CS35L41 自愈失败" "重载声卡后功放仍未恢复，可能需要重启。" "normal"
  exit 1
}
