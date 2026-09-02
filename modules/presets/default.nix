{
  lib,
  ...
}:
{
  options.funkcia.os.preset = lib.mkOption {
    type = lib.types.nullOr (
      lib.types.enum [
        "pc"
        "server"
      ]
    );

    description = ''
      NixOS 的预设。
      - `pc` 是作为桌面系统使用的预设，拥有 GUI 和各种开发工具。
      - `server` 是作为服务器系统使用的预设，没有 GUI，默认需要手动分配 IP 地址。
    '';
  };
}
