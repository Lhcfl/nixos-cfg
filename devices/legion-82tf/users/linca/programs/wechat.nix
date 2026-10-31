# 会赢吗？
# 微信经常会偷偷改文件导致 hash mismatch，如果炸了就关掉微信
{ pkgs, lib, ... }:
let
  # 临时改成 true，对比 nixpkgs 版微信和 flatpak 版的 bug 数量
  enable = true;

  # 微信主窗口是 Qt5，会话里没有 QT_IM_MODULE 时它会退到 text-input-v2，
  # 而 wlroots 侧只有 text-input-v3，于是输入法完全调不出来。
  # 微信自带了 fcitx5 的 Qt 客户端（二进制里有 fcitx::FcitxQt* / portal.Fcitx），
  # 显式指定 fcitx 后走 fcitx5 的 Qt/D-Bus 前端，原生 Wayland 下输入法正常，
  # 窗口也不会再出现走 XWayland 时的那些弹窗/菜单渲染问题。
  wechatIme = pkgs.symlinkJoin {
    name = "wechat-ime";
    paths = [ pkgs.wechat ];
    nativeBuildInputs = [ pkgs.makeWrapper ];
    postBuild = ''
      wrapProgram $out/bin/wechat --set-default QT_IM_MODULE fcitx
    '';
  };
in
{
  config = lib.mkIf enable {
    home.packages = [ wechatIme ];
  };
}
