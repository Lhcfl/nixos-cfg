{
  this,
  pkgs,
  lib,
  ...
}:
{
  this.options.enable = lib.mkEnableOption "v2rayn, a GUI for v2ray";

  config = lib.mkIf this.config.enable {
    tessera.settings.general.autostart = [ "v2rayN" ];

    home.packages = with pkgs; [
      v2rayn
      xray
    ];

    xdg.dataFile."v2rayN/bin/xray/xray".source = lib.getExe pkgs.xray;
    xdg.dataFile."v2rayN/bin/geoip.dat".source = "${pkgs.v2ray-rules-dat}/share/v2ray/geoip.dat";
    xdg.dataFile."v2rayN/bin/geosite.dat".source = "${pkgs.v2ray-rules-dat}/share/v2ray/geosite.dat";

    tessera.settings.window-rule.v2rayn = {
      match = {
        app_id = "v2rayN";
        is_floating = false;
      };
      default_scratchpad = "default";
    };
  };
}
