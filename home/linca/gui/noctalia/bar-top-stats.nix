{
  inputs,
  ...
}:
let
  kdl = inputs.nix-kdl.kdl;

  barname = "top-stats";
in
{
  funkcia.hm.gui.wms.niri.settings =
    with kdl.extras.niri;
    kdl.formats.v1 [
      (layer-rule [
        (match { namespace = "noctalia-bar-${barname}"; })
        (background-effect [
          (blur false)
        ])
      ])
    ];

  funkcia.hm.gui.noctalia.bars.${barname} = {
    start = [
      {
        type = "group";
        widget_spacing = 3;
        members = [
          {
            type = "sysmon";
            stat = "cpu_usage";
          }
          {
            type = "sysmon";
            stat = "ram_pct";
          }
          {
            type = "sysmon";
            stat = "cpu_temp";
          }
          {
            type = "sysmon";
            stat = "disk_used_pct";
          }
          {
            network_speed_compact = true;
            stat = "net_rx";
            type = "sysmon";
            visualization = "none";
          }
          {
            network_speed_compact = true;
            stat = "net_tx";
            type = "sysmon";
            visualization = "none";
          }
        ];
      }
    ];
    center = [ { type = "active_window"; } ];
    end = [
      {
        type = "group";
        members = [
          { type = "bluetooth"; }
          { type = "clipboard"; }
          { type = "caffeine"; }
          { type = "noctalia/wallhaven:wallhaven"; }
          {
            type = "brightness";
            actions = {
              scroll_down = "brightness-down 1%";
              scroll_up = "brightness-up 1%";
            };
          }
          { type = "network"; }
        ];
      }
    ];

    settings = {
      background_opacity = 0;
      capsule = true;
      concave_edge_corners = false;
      enabled = true;
      font_family = "Noto Sans";
      margin_ends = 0;
      padding = 4;
      scale = 0.85;
      shadow = false;
      thickness = 28;
    };
  };
}
