{
  inputs,
  config,
  pkgs,
  ...
}:
let
  domain = config.funkcia.os.domains.mat.value;

  sable-config = pkgs.writeText "sable-config.json" (
    builtins.toJSON {
      "branding" = {
        "appName" = "星屑矩阵";
      };
      "defaultHomeserver" = 0;
      "homeserverList" = [ domain ];
      "allowCustomHomeservers" = false;

      "featuredCommunities" = {
        "openAsDefault" = false;
        "spaces" = [ ];
        "rooms" = [ ];
        "servers" = [ ];
      };

      # sable does not support hash router
    }
  );

  sable-next = fetchTarball {
    url = "https://git.sable.moe/SableClient/sable-next/releases/download/v2.3.9/sable-2.3.9-web.tar.gz";
    sha256 = "sha256-J351B4mZ+egyqJE+mG5aIgqml8I8PeXf64Z4k8hfv9w=";
  };

  configured = pkgs.symlinkJoin {
    name = "sable-configured";
    paths = [ sable-next ];
    buildInputs = [ pkgs.nushell ];

    postBuild = ''
      mv $out/config.json $out/default-config.json
      nu -c "open $out/default-config.json | merge deep (open ${sable-config}) | save $out/config.json"
    '';
  };
in
{
  services.nginx.virtualHosts.${domain}.locations."/" = {
    root = "${configured}";
    tryFiles = "$uri $uri.html $uri/ /index.html";
  };
}
