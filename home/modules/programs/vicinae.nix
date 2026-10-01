{
  inputs,
  this,
  lib,
  ...
}:
{
  this.options = {
    enable = lib.mkEnableOption "vicinae";
    systemd.enable = lib.mkEnableOption "vicinae systemd service" // {
      default = true;
    };
    settings = lib.mkOption {
      type = lib.types.json;
      default = { };
      description = "vicinae settings";
    };
  };

  config = lib.mkIf this.config.enable {
    programs.vicinae.enable = true;
    programs.vicinae.systemd.enable = this.config.systemd.enable;

    xdg.configFile."vicinae/settings-hm.json".text = builtins.toJSON this.config.settings;
    funkcia.hm.merge-files.".config/vicinae/settings.json" = {
      imports = [ "settings-hm.json" ];
    };

    funkcia.hm.gui.niri.settings =
      let
        kdl = inputs.nix-kdl.kdl;
      in
      with kdl.extras.niri;
      kdl.formats.v1 [
        (layer-rule [
          (match { namespace = "vicinae"; })
          (background-effect [
            (xray false)
          ])
        ])
      ];
  };
}
