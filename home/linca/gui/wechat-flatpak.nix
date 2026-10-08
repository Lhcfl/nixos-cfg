{ ... }: {
  # WeChat 的 flatpak 只共享 x11 socket，而 niri 会话全局设了
  # QT_QPA_PLATFORM=wayland，Qt 找不到 wayland 平台插件会直接 abort。
  funkcia.hm.flatpak.overrides."com.tencent.WeChat".Environment = {
    LANG = "zh_CN.UTF-8";
    LC_CTYPE = "zh_CN.UTF-8";
    QT_QPA_PLATFORM = "xcb";
  };
}
