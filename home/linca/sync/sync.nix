{ config, ... }:
let
  inherit (config.lib.file) mkOutOfStoreSymlink;

  sync-config = x: {
    source = mkOutOfStoreSymlink (config.funkcia.install-dir + "/home/linca/sync/Config/${x}");
    target = ".config/${x}";
  };
in
{
  home.file = {
    sync-nvim = sync-config "nvim";
    sync-hypr = sync-config "hypr";
  };
}
