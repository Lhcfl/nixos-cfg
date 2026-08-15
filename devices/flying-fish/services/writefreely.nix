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
  };
}
