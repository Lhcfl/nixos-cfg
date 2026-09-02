{
  pkgs,
  lib,
  config,
  ...
}:
{
  options.funkcia.hm.gui.v2rayn.enable = lib.mkEnableOption "v2rayn, a GUI for v2ray" // {
    default = true;
  };

  config = lib.mkIf config.funkcia.hm.gui.v2rayn.enable {
    funkcia.hm.gui.wms.niri.settings = ''
      spawn-at-startup "v2rayN"
    '';

    home.packages = with pkgs; [
      v2rayn
      xray
      # v2ray-rules-dat
    ];

    xdg.configFile."v2rayN/bin/xray/xray".source = lib.getExe pkgs.xray;
  };
}
