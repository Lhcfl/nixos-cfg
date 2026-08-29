{ ... }:
{
  config = {
    funkcia.hm.gui.noctalia.bars.win11 = {
      start = [
        { type = "wallpaper"; }
        { type = "weather"; }
        {
          type = "audio_visualizer";
          bands = 20;
        }
        {
          type = "media";
          hide_when_no_media = true;
          max_length = 160;
          title_scroll = "always";
        }
      ];

      center = [
        {
          type = "control-center";
          custom_image = ./nixos.png;
          scale = 1.6;
        }
        {
          type = "launcher";
          scale = 1.6;
        }
        {
          type = "taskbar";
          group_by_workspace = true;
          group_single_icon_per_app = true;
          hide_empty_workspaces = true;
          scale = 1.6;
        }
      ];

      end = [
        {
          type = "tray";
          detached_panel = true;
          drawer = true;
          drawer_columns = 5;
          pinned = [
            "Telegram Desktop"
            "v2rayN"
            "Fcitx"
            "chrome_status_icon_1"
            "steam"
          ];
        }
        {
          type = "group";
          members = [
            {
              type = "network";
              show_label = false;
            }
            {
              type = "volume";
              show_label = false;
            }
            {
              type = "battery";
              show_label = false;
            }
          ];
        }
        {
          type = "group";
          members = [
            {
              type = "spacer";
              length = 5;
            }
            {
              type = "clock";
              format = "{:%H:%M:%S}\\n{:%Y/%m/%d}";
            }
            { type = "notifications"; }
          ];
        }
      ];

      settings = {
        concave_edge_corners = true;
        enabled = true;
        margin_edge = 0;
        margin_ends = 0;
        position = "bottom";
        radius = 0;
        radius_bottom_right = 80;
        thickness = 45;
        widget_spacing = 9;
      };
    };
  };
}
