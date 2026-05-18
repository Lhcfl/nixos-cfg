-- Converted from autostart.conf
-- https://wiki.hypr.land/Configuring/Basics/Autostart/

local terminal = "kitty"

hl.on("hyprland.start", function()
  hl.exec_cmd("hypridle")
  hl.exec_cmd("fcitx5")
  hl.exec_cmd("firefox")
  hl.exec_cmd(terminal)
  hl.exec_cmd("[workspace 9 silent] v2rayN")
  hl.exec_cmd("noctalia-shell")
  hl.exec_cmd("vicinae server")
end)
