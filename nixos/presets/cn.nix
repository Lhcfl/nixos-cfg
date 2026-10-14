{
  lib,
  config,
  inputs,
  ...
}:
{
  options.funkcia.os.presets.cn.enable = lib.mkEnableOption "这台机器是 CN 机器";

  config = lib.mkIf config.funkcia.os.presets.cn.enable {
    nix.settings.substituters = [
      "https://mirrors.cernet.edu.cn/nix-channels/store" # cernet 自动选择 nix channels
    ];

    networking.nameservers = lib.mkForce [
      "223.5.5.5"
      "114.114.114.114"
    ];

    # rust-overlay 把 Rust 官方预编译包当 FOD 直接抓（没有 nix cache），CN 机器改用
    # CERNET 联合镜像（自动重定向到最近的学校镜像）。只有当设备确实引入了
    # rust-overlay（`pkgs` 里已有 `rust-bin`）时才覆盖，其他设备不受影响。
    # `mkAfter` 保证本 overlay 在 rust-overlay 的 overlay 之后生效。
    nixpkgs.overlays = lib.mkAfter [
      (
        final: prev:
        lib.optionalAttrs (prev ? rust-bin) {
          rust-bin = inputs.rust-overlay.lib.mkRustBin {
            distRoot = "https://mirrors.cernet.edu.cn/rustup/dist";
          } final;
        }
      )
    ];
  };
}
