{
  config,
  pkgs,
  ...
}:
let
  domain = config.flying-fish.prefix-domain "mat";

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
{
  services.nginx = {
    enable = true;

    virtualHosts.${domain} = {
      forceSSL = true;
      enableACME = true;

      locations."/" = {
        root = "${cinny}";
      };
    };
  };
}
