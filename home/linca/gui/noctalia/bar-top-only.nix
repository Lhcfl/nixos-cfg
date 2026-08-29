{
  inputs,
  ...
}:
let
  kdl = inputs.nix-kdl.kdl;

  barname = "top-only";
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
    settings = {
      enabled = false;
      background_opacity = 0;
      capsule = true;
      capsule_padding = 5;
      margin_edge = 0;
      margin_ends = 0;
      scale = 0.85;
      shadow = false;
      thickness = 25;
      widget_spacing = 3;
    };

    start = [
      {
        type = "workspaces";
        active_pill_size = 1.75;
        label_source = "name";
        labels_only_when_occupied = true;
      }
      {
        type = "group";
        members = [
          {
            type = "sysmon";
            stat = "cpu_usage";
          }
          {
            type = "sysmon";
            stat = "ram_pct";
          }
        ];
        padding = 4;
      }
      { type = "weather"; }
    ];

    center = [
      { type = "active_window"; }
      {
        type = "media";
        hide_when_no_media = true;
        max_length = 160;
        title_scroll = "always";
      }
    ];

    end = [
      {
        type = "tray";
        capsule = true;
        capsule_padding = 8;
      }
      {
        type = "group";
        members = [
          { type = "noctalia/wallhaven:wallhaven"; }
          { type = "clipboard"; }
        ];
        padding = 4;
      }
      { type = "network"; }
      {
        type = "group";
        members = [
          { type = "bluetooth"; }
          {
            type = "volume";
            show_label = false;
          }
          {
            type = "brightness";
            actions = {
              scroll_down = "brightness-down 1%";
              scroll_up = "brightness-up 1%";
            };
          }
          { type = "notifications"; }
        ];
        padding = 4;
      }
      { type = "battery"; }
      { type = "clock"; }
    ];

  };
}
