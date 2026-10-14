{
  pkgs,
  lib,
  config,
  ...
}:
{
  config = lib.mkIf config.linca.work.enable {
    home.packages = [
      # 需要 rust-overlay（设备必须在 flake.nix 的 devices.<name>.imports 里引入
      # self.nixosModules.rust-overlay，否则 pkgs.rust-bin 不存在）。
      # 改 latest 为日期（如 "2026-10-13"）可固定 nightly。
      (pkgs.rust-bin.nightly.latest.default.override {
        extensions = [
          "rust-analyzer"
          "rust-src"
        ];
      })
    ];
  };
}
