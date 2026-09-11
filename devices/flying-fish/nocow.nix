{ config, lib, pkgs, ... }:
let
  # btrfs 上对数据库目录关闭 COW：
  #  - PostgreSQL 官方建议 PGDATA 关 COW（否则写放大/碎片化）
  #  - SQLite 在 btrfs 上关 COW 可避免 WAL/锁语义问题
  # 注意：chattr +C 只对「新建文件」生效；目录打上 C 后，其下新文件自动继承。
  # 已存在的数据需一次性重写（见 migration 脚本）。
  chattr = "${pkgs.e2fsprogs.bin}/bin/chattr";
  nocow = dir: lib.mkBefore ''
    ${chattr} +C "${dir}" 2>/dev/null || true
  '';
in
{
  systemd.services = lib.mkMerge [
    {
      postgresql.preStart = nocow config.services.postgresql.dataDir;
      vaultwarden.preStart = nocow "/var/lib/vaultwarden";
      writefreely.preStart = nocow "/var/lib/writefreely";
    }
    (lib.mkIf config.services.matrix-synapse.enable {
      # 媒体库（大文件，减少碎片）
      matrix-synapse.preStart = nocow "/var/lib/matrix-synapse";
    })
  ];
}
