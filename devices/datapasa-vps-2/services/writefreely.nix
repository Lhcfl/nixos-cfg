{ config, lib, ... }:
let
  host = config.funkcia.server.domains.write.value;
in
{
  funkcia.server.domains = [ host ];

  services.writefreely = {
    inherit host;
    enable = true;
    nginx.enable = true;
    nginx.forceSSL = true;
    acme.enable = true;
  };
}
