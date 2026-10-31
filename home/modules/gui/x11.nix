# X11 / Xwayland 会话层的杂项。
#
# home-manager 的 xresources 模块只会把 xrdb -merge 塞进 xsession.profileExtra
# （X session 专用），Wayland 会话里不执行；它的 home.file onChange 又要求触发时
# 环境里已经有 DISPLAY。于是 xresources.properties 生成出来的 ~/.Xresources
# 虽然存在，却从来没进过 X server。
#
# 后果在「Xwayland 按物理分辨率渲染」的配置下很明显：X11 客户端按 96dpi 排版，
# 而 Wayland 侧是 1.5 倍，所以微信这类 X11 应用里的 fcitx5 候选框（XIM 客户端
# 用的是独立的 X11 窗口，尺寸取自 Xft.dpi）会比桌面其他部分小一圈。
#
# 只要配了 xresources（properties 或 extraConfig 非空）就说明这份资源需要生效，
# 这里自动接管，不额外提供开关。
{
  pkgs,
  lib,
  config,
  ...
}:
let
  xresourcesConfigured =
    (config.xresources.properties != null && config.xresources.properties != { })
    || config.xresources.extraConfig != "";
in
{
  config = lib.mkIf (config.funkcia.hm.gui.enable && xresourcesConfigured) {
    # WM 会话启动时把 ~/.Xresources 灌进 X server。
    funkcia.hm.gui.wm.spawn-at-startup = [
      "${lib.getExe pkgs.xrdb} -merge ${config.xresources.path}"
    ];
  };
}
