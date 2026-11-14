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

  sable = pkgs.symlinkJoin {
    name = "sable-configured";
    paths = [ pkgs.sable ];
    buildInputs = [ pkgs.nushell ];

    postBuild = ''
      mv $out/config.json $out/default-config.json
      nu -c "open $out/default-config.json | merge deep (open ${sable-config}) | save $out/config.json"
    '';
  };
in
{
  services.nginx.virtualHosts.${domain}.locations."/" = {
    root = "${sable}";
  };
}
