# nixpkgs 新版 aggregateModules 会把外部模块的 `<mod>.ko.cer` 合并进
# modules.cer（NixOS/nixpkgs#575192）。lenovo-legion-module 走的是
# Makefile 自带的 install 目标（手工 install *.ko），既没有签名也不会生成
# .cer，于是 `linux-<ver>-modules` 构建时 cat 缺文件失败。
# 这里在安装后用 kmodigest 给 legion-laptop.ko 签名并生成同目录的 .ko.cer。
{
  nixpkgs.overlays = [
    (final: prev: {
      linuxPackages_latest = prev.linuxPackages_latest.extend (
        _self: super: {
          lenovo-legion-module = super.lenovo-legion-module.overrideAttrs (old: {
            postInstall = (old.postInstall or "") + ''
              ${final.kmodigest}/bin/kmodigest \
                "$out/lib/modules/${super.kernel.modDirVersion}/kernel/drivers/platform/x86/legion-laptop.ko"
            '';
          });
        }
      );
    })
  ];
}
