{ config, lib, ... }:
{
  config = lib.mkIf config.funkcia.hm.gui.enable {
    services.hyprpolkitagent.enable = true;

    services = {
      mako = {
        enable = true;
        settings = {
          default-timeout = 5000;
          border-radius = 10;
          font = "Noto Sans CJK SC";
          width = 350;
          height = 150;

          # Colors
          background-color = "#303446";
          text-color = "#c6d0f5";
          border-color = "#babbf1";
          progress-color = "over #414559";

          "urgency=high" = {
            border-color = "#ef9f76";
          };
        };
      };
    };

    programs = {
      waybar = {
        enable = true;
        systemd.enable = true;
      };
    };
  };
}
