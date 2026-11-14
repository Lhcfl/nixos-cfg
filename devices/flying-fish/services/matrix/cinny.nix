{
  config,
  pkgs,
  ...
}:
let
  domain = config.funkcia.os.domains.mat.value;

  cinny-config = pkgs.writeText "cinny-config" (
    builtins.toJSON {
      "defaultHomeserver" = 0;
      "homeserverList" = [ domain ];
      "allowCustomHomeservers" = false;

      "featuredCommunities" = {
        "openAsDefault" = false;
        "spaces" = [ ];
        "rooms" = [ ];
        "servers" = [ ];
      };

      "hashRouter" = {
        "enabled" = true;
        "basename" = "/";
      };
    }
  );

  cinny = pkgs.symlinkJoin {
    name = "cinny-configured";
    paths = [ pkgs.cinny ];

    postBuild = ''
      rm $out/config.json
      cp ${cinny-config} $out/config.json
    '';
  };
in
# 前端换成 sable 了
if false then
  {
    services.nginx.virtualHosts.${domain}.locations."/" = {
      root = "${cinny}";
    };
  }
else
  { }
