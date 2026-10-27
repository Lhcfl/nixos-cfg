{ lib, config, ... }: {
  config = lib.mkIf config.funkcia.hm.gui.enable {
    # WeChat 4.1.13 起支持原生 Wayland。不要再设 QT_QPA_PLATFORM=xcb：
    # flatpak 的 sockets 是 fallback-x11;wayland，有 wayland 时不给 X11 socket，
    # 沙箱里 DISPLAY 为空，强行 xcb 会直接 abort。
    funkcia.hm.flatpak.overrides."com.tencent.WeChat".Environment = {
      LANG = "zh_CN.UTF-8";
      LC_CTYPE = "zh_CN.UTF-8";
    };
  };
}
