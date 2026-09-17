# 用 mkcert 生成本地开发证书，并由 systemd timer 每周轮换。
#
# 与实验手册完全一致，只是一次性声明好：
#   mkcert -install                       # 把 CA 装进浏览器信任库
#   mkcert -key-file ... -cert-file ... localhost 127.0.0.1 ::1 linca.local
#
# 说明：
#   * NixOS 的系统信任库是只读的，mkcert 装不进去，会提示
#     "not yet supported on this Linux" 并跳过；浏览器（NSS）信任库正常生效。
#   * NSS 安装依赖 certutil，所以 PATH 里加了 pkgs.nss.tools。
#   * 必须以用户身份运行，才能写入 ~/.local/share/mkcert 与浏览器 profile。
{
  pkgs,
  ...
}:
{
  systemd.services.local-certs = {
    wantedBy = [ "multi-user.target" ];
    path = [
      pkgs.mkcert
      pkgs.nss.tools
    ];
    serviceConfig = {
      Type = "oneshot";
      User = "linca";
      StateDirectory = "local-certs"; # /var/lib/local-certs
    };
    script = ''
      set -eu
      mkcert -install
      mkcert \
        -key-file "$STATE_DIRECTORY/localhost-key.pem" \
        -cert-file "$STATE_DIRECTORY/localhost.pem" \
        localhost 127.0.0.1 ::1 linca.local
    '';
  };

  systemd.timers.local-certs = {
    wantedBy = [ "timers.target" ];
    timerConfig = {
      OnCalendar = "weekly";
      Persistent = true;
    };
  };
}
