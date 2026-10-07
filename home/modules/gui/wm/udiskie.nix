# 为 WM 会话提供可移动设备的自动挂载。
#
# niri / umbriel 自身都不监听热插拔，而 `services.udisks2` 只提供挂载能力与
# polkit 策略、不会自动挂载。udiskie 负责监听 udev 并在设备插入时调用 udisks
# 挂载（GNOME 那套是由 gvfs 代劳的，这里没有）。
{
  lib,
  config,
  ...
}:
let
  cfg = config.funkcia.hm.gui.wm;
in
{
  config = lib.mkIf (cfg.niri.enable || cfg.umbriel.enable) {
    services.udiskie = {
      enable = true;
      # 有 StatusNotifier 托盘就显示图标，否则静默。
      tray = "auto";
      notify = true;
    };
  };
}
