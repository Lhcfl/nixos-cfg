#!/usr/bin/env bash
#
# dell-workstation-new 重装脚本（在 live USB 里以 root 运行）
#
# 磁盘布局（全部由本脚本完成，不依赖 disko）：
#
#   nvme0n1p1    1G    ESP                  /boot
#   nvme0n1p2   16G    swap
#   nvme0n1p3  剩余     bcache cache device
#   sda1       931G    bcache backing device
#
#   /dev/bcache0 -> btrfs
#                    ├─ @root -> /
#                    ├─ @home -> /home
#                    └─ @nix  -> /nix
#
# 用法：
#   FLAKE_DIR=/run/media/linca/USB/nixos-cfg ./install.sh
#
set -euo pipefail

FLAKE_ATTR="${FLAKE_ATTR:-dell-workstation-new}"
FLAKE_DIR="${FLAKE_DIR:-/tmp/nixos-cfg}"
SSD="${SSD:-/dev/nvme0n1}"
HDD="${HDD:-/dev/sda}"
ESP_LABEL=dell-esp
SWAP_LABEL=dell-swap
CACHE_LABEL=dell-bcache-cache
BACKING_LABEL=dell-bcache-backing
BCACHE_LABEL=data
ROOT=/mnt

log() { printf '\n\033[1;32m==> %s\033[0m\n' "$*"; }
die() { printf '\n\033[1;31m!! %s\033[0m\n' "$*" >&2; exit 1; }
part() { printf '/dev/disk/by-partlabel/%s' "$1"; }

[[ $EUID -eq 0 ]] || die "请以 root 运行"
[[ -e "$FLAKE_DIR/flake.nix" ]] || die "$FLAKE_DIR 不是 flake 仓库"

log "即将清空这两个磁盘："
lsblk -d -o NAME,SIZE,MODEL "$SSD" "$HDD"
printf '\n输入 WIPE 继续，其它任何输入都会中止: '
read -r confirm
[[ "$confirm" == "WIPE" ]] || die "已中止"

# ---------------------------------------------------------------- 1. 分区
log "分区 $SSD"
sgdisk --zap-all "$SSD"
sgdisk \
  -n "1:0:+1G"  -t "1:EF00" -c "1:$ESP_LABEL"     \
  -n "2:0:+16G" -t "2:8200" -c "2:$SWAP_LABEL"    \
  -n "3:0:0"    -t "3:8309" -c "3:$CACHE_LABEL"   \
  "$SSD"

log "分区 $HDD"
sgdisk --zap-all "$HDD"
sgdisk \
  -n "1:0:0" -t "1:8309" -c "1:$BACKING_LABEL" \
  "$HDD"

partprobe "$SSD" "$HDD" || true
udevadm settle --timeout 60

# ---------------------------------------------------------------- 2. 格式化
log "格式化 ESP 与 swap"
mkfs.vfat -F 32 -n ESP "$(part "$ESP_LABEL")"
mkswap -L swap "$(part "$SWAP_LABEL")"

# ---------------------------------------------------------------- 3. bcache
log "创建 bcache：backing=$(part "$BACKING_LABEL") cache=$(part "$CACHE_LABEL")"
make-bcache \
  --bdev "$(part "$BACKING_LABEL")" \
  --cache "$(part "$CACHE_LABEL")" \
  --label "$BCACHE_LABEL" \
  --discard

udevadm settle --timeout 60 || true
for _ in $(seq 20); do
  [[ -e /dev/bcache0 ]] && break
  sleep 0.5
done
[[ -e /dev/bcache0 ]] || die "/dev/bcache0 没有出现，用 bcache-super-show $(part "$BACKING_LABEL") 排查"

bcache-super-show "$(part "$BACKING_LABEL")" | grep -E 'dev.uuid|dev.label|set.uuid'

# ---------------------------------------------------------------- 4. btrfs
log "btrfs：文件系统与子卷"
mkfs.btrfs -f -L "$BCACHE_LABEL" /dev/bcache0
mount /dev/bcache0 "$ROOT"
btrfs subvolume create "$ROOT/@root"
btrfs subvolume create "$ROOT/@home"
btrfs subvolume create "$ROOT/@nix"
umount "$ROOT"

# ---------------------------------------------------------------- 5. 挂载
log "挂载安装目标"
mount -o subvol=@root,compress=zstd,noatime /dev/bcache0 "$ROOT"
mkdir -p "$ROOT/home" "$ROOT/nix" "$ROOT/boot"
mount -o subvol=@home,compress=zstd /dev/bcache0 "$ROOT/home"
mount -o subvol=@nix,compress=zstd,noatime /dev/bcache0 "$ROOT/nix"
mount "$(part "$ESP_LABEL")" "$ROOT/boot"
swapon "$(part "$SWAP_LABEL")" || true
findmnt -R "$ROOT"

# ---------------------------------------------------------------- 6. sops key
log "sops age key"
mkdir -p "$ROOT/var/lib/age"
if compgen -G '/run/media/*/age-keys.txt' > /dev/null; then
  install -m 0600 /run/media/*/age-keys.txt "$ROOT/var/lib/age/keys.txt"
  log "已从 U 盘恢复 age key"
else
  printf '\033[1;33m!! 没找到 /run/media/*/age-keys.txt。\n'
  printf '   装完后必须手动放入 /var/lib/age/keys.txt，否则 sops secrets 解不开。\033[0m\n'
  read -rp "按回车继续，或 Ctrl-C 中止: " _
fi

# ---------------------------------------------------------------- 7. install
log "nixos-install"
nixos-install \
  --flake "$FLAKE_DIR#$FLAKE_ATTR" \
  --root "$ROOT" \
  --no-root-passwd

log "完成，可以 reboot。"
printf '\n新系统装好后自己把仓库 clone 到 ~/nixos-cfg 即可。\n'
printf '首次进入系统后检查：\n'
printf '  findmnt /\n  lsblk\n  cat /sys/block/bcache0/bcache/cache_mode\n'
