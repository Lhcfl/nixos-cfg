{ pkgs, ... }: {
  home = {
    # packages = [ pkgs.wpsoffice-cn ];

    # # WPS 自带 Qt 只有 xcb 插件，Wayland 分数缩放下 DPI 异常。
    # # WPS 会读取 WPS_FORCED_DPI 并转成 QT_FONT_DPI（128 实测合适）。
    # sessionVariables.WPS_FORCED_DPI = "128";

    # avalonia 的 X11 DPI 计算在新版本 xwayland-satellite 下有问题
    # 强制覆盖 scale factor
    sessionVariables.AVALONIA_SCREEN_SCALE_FACTORS = 1.25;
  };
}
