# funkcia.server.的磁盘布局 (disko)
#
# 机器实际拓扑 (见 lsblk)：
#   xvda  7G      -> 系统盘: 1M BIOS-boot + 1G /boot(vfat/FAT32)
#   xvdb  48.8G   ┐
#   xvdc  48.8G   ├─ RAID0 (4 盘) -> /dev/md/root (btrfs + 子卷)
#   xvde  48.8G   │
#   xvdf  48.8G   ┘
#
# ⚠️ RAID0 无冗余：任一块数据盘损坏，根文件系统即整体丢失。
{
  disko.devices = {
    disk = {
      # ---- 系统盘：引导 + /boot ----
      xvda = {
        type = "disk";
        device = "/dev/xvda";
        content = {
          type = "gpt";
          partitions = {
            # GRUB (legacy BIOS) 在 GPT 上需要的 BIOS boot 分区
            BIOS = {
              size = "1M";
              type = "EF02";
            };
            boot = {
              size = "1G";
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
                mountOptions = [ "umask=0077" ];
              };
            };
          };
        };
      };

      # ---- 4 块数据盘：各出 1 个 RAID 成员分区 ----
      xvdb = {
        type = "disk";
        device = "/dev/xvdb";
        content = {
          type = "gpt";
          partitions.mdraid = {
            size = "100%";
            content = {
              type = "mdraid";
              name = "root";
            };
          };
        };
      };
      xvdc = {
        type = "disk";
        device = "/dev/xvdc";
        content = {
          type = "gpt";
          partitions.mdraid = {
            size = "100%";
            content = {
              type = "mdraid";
              name = "root";
            };
          };
        };
      };
      xvde = {
        type = "disk";
        device = "/dev/xvde";
        content = {
          type = "gpt";
          partitions.mdraid = {
            size = "100%";
            content = {
              type = "mdraid";
              name = "root";
            };
          };
        };
      };
      xvdf = {
        type = "disk";
        device = "/dev/xvdf";
        content = {
          type = "gpt";
          partitions.mdraid = {
            size = "100%";
            content = {
              type = "mdraid";
              name = "root";
            };
          };
        };
      };
    };

    # ---- RAID0 阵列 -> 根文件系统 ----
    mdadm = {
      root = {
        type = "mdadm";
        level = 0;
        metadata = "1.2";
        content = {
          type = "btrfs";
          extraArgs = [ "-f" ];
          # 子卷布局（沿用原配置的 btrfs 方案，去掉示例里的 /test 等）
          subvolumes = {
            "/@" = {
              mountpoint = "/";
            };
            "/home" = {
              mountOptions = [ "compress=zstd" ];
              mountpoint = "/home";
            };
            "/nix" = {
              mountOptions = [
                "compress=zstd"
                "noatime"
              ];
              mountpoint = "/nix";
            };
            "/var" = {
              mountpoint = "/var";
            };
            "/swap" = {
              mountpoint = "/.swapvol";
              swap.swapfile.size = "512M";
            };
          };
        };
      };
    };
  };
}
