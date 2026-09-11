{ config, lib, ... }:
let
  host = config.flying-fish.prefix-domain "write";
in
{
  flying-fish.domains = [ host ];

  services.writefreely = {
    inherit host;
    enable = true;
    nginx.enable = true;
    nginx.forceSSL = true;
    acme.enable = true;

    # 迁移自旧 config.ini 的 [app] 设置
    settings.app = {
      site_name = "Stelpolva Write";
      site_description = "自由地写在星屑";
      theme = "write";
      webfonts = true;
      single_user = false;
      open_registration = false;
      open_deletion = true;
      min_username_len = 3;
      max_blogs = 1024;
      federation = true;
      public_stats = true;
      local_timeline = true;
      user_invites = "admin";
      default_visibility = "public";
      update_checks = false;
      disable_password_auth = false;
    };
  };
}
