{
  config,
  pkgs,
  ...
}:
let
  domain = config.funkcia.os.domains.mat.value;
in
{
  # 矩阵管理 UI，挂在 https://<domain>/admin/ 下。
  # ketesa 的静态资源都是 ./ 相对路径，所以只要 URL 以 /admin/ 结尾即可，
  # 不需要 upstream 的 subpath 专门构建。
  services.nginx.virtualHosts.${domain}.locations = {
    # /admin 没有结尾斜杠时相对资源会指错，先重定向
    "= /admin" = {
      return = "301 /admin/";
    };

    "/admin/" = {
      alias = "${pkgs.ketesa}/";
      index = "index.html";
    };
  };
}
