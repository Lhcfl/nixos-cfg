{
  lib,
  config,
  this,
  ...
}:
{
  this.options.enable = lib.mkEnableOption "collect user services";

  config.systemd.tmpfiles.settings.funkcia-users = lib.mkIf this.config.enable (
    lib.pipe config.home-manager.users [
      (lib.attrsets.filterAttrs (name: value: value.funkcia.hm.avatar != null))
      (lib.attrsets.mapAttrs' (
        name: user: {
          name = "/var/lib/AccountsService/icons/${name}";
          value."L+" = {
            mode = "0444";
            # avatar 在 flake source 里，直接把 source 路径写进 tmpfiles 会指向一个
            # 随 flake 变化而被回收的 store 目录。用 builtins.path 复制成独立的
            # store 文件（0444，全局可读），greeter 用户无需访问 $HOME 即可读取。
            argument = toString (
              builtins.path {
                path = user.funkcia.hm.avatar;
                name = "avatar-${name}";
              }
            );
          };
        }
      ))
    ]
  );
}
