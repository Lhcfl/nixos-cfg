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

  sable = pkgs.stdenv.mkDerivation rec {
    pname = "sable-configured";
    version = "26.11.2";

    src = fetchTarball {
      url = "https://git.sable.moe/SableClient/sable-next/releases/download/v${version}/sable-${version}-web.tar.gz";
      sha256 = "sha256-lSeiBrZeGOO6tpeKkqCimhoXy3m2TPfwAW2kRudVyZQ=";
    };

    buildInputs = [ pkgs.nushell ];

    installPhase = ''
      runHook preInstall
      mkdir -p $out
      cp -r * $out/
      runHook postInstall
    '';

    postInstall = ''
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
