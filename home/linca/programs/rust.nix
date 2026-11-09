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
      # nightly 的版本由 flake.lock 里的 rust-overlay 钉住。
      (pkgs.rust-bin.nightly.latest.default.override {
        extensions = [
          "rust-analyzer"
          "rust-src"
        ];
      })
    ];
  };
}
