{ config, lib, ... }:
let
  cfg = config.funkcia.os.presets.container;
in
{
  options.funkcia.os.presets.container = {
    enable = lib.mkEnableOption "该系统是一个容器";
  };

  config = lib.mkIf cfg.enable {
    # Use systemd-resolved inside the container
    # Workaround for bug https://github.com/NixOS/nixpkgs/issues/162686
    networking.useHostResolvConf = lib.mkForce false;
    services.resolved.enable = true;
  };
}
