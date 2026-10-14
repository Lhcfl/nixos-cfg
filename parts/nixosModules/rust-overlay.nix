# https://github.com/oxalica/rust-overlay
# 注入 `pkgs.rust-bin`，供 `rust-bin.<channel>.<version>.<profile>` 选版本。
# 镜像等抓取来源的覆盖由各 presets（如 `funkcia.os.presets.cn`）自行追加 overlay。
{ inputs, ... }: {
  flake.nixosModules.rust-overlay = {
    nixpkgs.overlays = [ inputs.rust-overlay.overlays.default ];
  };
}
