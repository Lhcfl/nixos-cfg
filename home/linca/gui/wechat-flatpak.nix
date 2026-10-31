{ lib, config, ... }: {
  config = lib.mkIf config.funkcia.hm.gui.enable {
    # WeChat 4.1.13 起支持原生 Wayland，但它主窗口是 Qt 5.15，在 wayland 下
    # 不支持分数缩放：eDP-1 scale=1.5 时它会把缩放四舍五入成 2，于是自认为
    # 屏幕是 1280x800，把窗口高度钳死在 800（tile 本应 976），底部留一大片空白。
    # QT_SCALE_FACTOR_ROUNDING_POLICY=PassThrough 对 Qt5/QtWayland 无效。
    # 所以让它走 XWayland（1.5 缩放由合成器负责），窗口就能正常填满 tile。
    # 注意：必须同时给 X11 socket 并去掉 wayland socket，否则
    # sockets=fallback-x11;wayland 下有 wayland 就不给 X11，沙箱里 DISPLAY 为空，
    # 强行 xcb 会直接 abort。不要加 QT_SCALE_FACTOR，会和合成器缩放叠加。
    funkcia.hm.flatpak.overrides."com.tencent.WeChat" = {
      Context.sockets = [ "!wayland" "x11" ];
      Environment = {
        LANG = "zh_CN.UTF-8";
        LC_CTYPE = "zh_CN.UTF-8";
        QT_QPA_PLATFORM = "xcb";
      };
    };
  };
}
