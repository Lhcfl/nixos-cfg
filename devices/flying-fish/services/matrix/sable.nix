{
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
      "allowCustomHomeservers" = true;

      "featuredCommunities" = {
        "openAsDefault" = false;
        "spaces" = [ ];
        "rooms" = [ ];
        "servers" = [ ];
      };

      # sable does not support hash router
    }
  );

  sable = pkgs.symlinkJoin {
    name = "sable-configured";
    paths = [ pkgs.nur.repos.linyinfeng.sable-web ];

    buildInputs = with pkgs; [
      nushell
    ];

    postBuild = ''
      mv $out/config.json $out/default-config.json
      nu -c "open $out/default-config.json | merge deep (open ${sable-config}) | save $out/config.json"
    '';
  };
in
{
  services.nginx.virtualHosts.${domain}.locations."/" = {
    root = "${sable}";
    tryFiles = "$uri $uri.html $uri/ /index.html";
  };
}
