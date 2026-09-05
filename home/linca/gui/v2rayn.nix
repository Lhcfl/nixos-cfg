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

    xdg.dataFile."v2rayN/bin/xray/xray".source = lib.getExe pkgs.xray;
    xdg.dataFile."v2rayN/bin/geoip.dat".source = "${pkgs.v2ray-rules-dat}/share/v2ray/geoip.dat";
    xdg.dataFile."v2rayN/bin/geosite.dat".source = "${pkgs.v2ray-rules-dat}/share/v2ray/geosite.dat";
  };
}
