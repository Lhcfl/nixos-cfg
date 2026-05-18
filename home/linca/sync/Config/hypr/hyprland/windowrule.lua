-- Converted from windowrule.conf
local suppressMaximizeRule = hl.window_rule({
  -- Ignore maximize requests from all apps. You'll probably like this.
  name           = "suppress-maximize-events",
  match          = { class = ".*" },

  suppress_event = "maximize",
})
suppressMaximizeRule:set_enabled(false)

hl.window_rule({
  -- Fix some dragging issues with XWayland
  name     = "fix-xwayland-drags",
  match    = {
    class      = "^$",
    title      = "^$",
    xwayland   = true,
    float      = true,
    fullscreen = false,
    pin        = false,
  },

  no_focus = true,
})

-- Hyprland-run windowrule
hl.window_rule({
  name = "move-hyprland-run",
  match = { class = "hyprland-run" },
  move = "20 monitor_h-120",
  float = true,
})

hl.window_rule({
  name = "telegram-workspace-5",
  match = { class = "org.telegram.desktop" },
  workspace = 5,
})

hl.window_rule({
  name = "firefox-workspace-2",
  match = { class = "firefox" },
  workspace = 2,
})

hl.window_rule({
  name = "zed-workspace-3",
  match = { class = "dev.zed.Zed" },
  workspace = 3,
})

hl.window_rule({
  name = "code-workspace-3",
  match = { class = "code" },
  workspace = 3,
})

hl.window_rule({
  name = "kitty-opacity",
  match = { class = "kitty" },
  opacity = 0.8,
})

hl.layer_rule({
  name = "vicinae-adjust",
  match = { namespace = "vicinae" },
  blur = true,
  ignore_alpha = 0,
})

hl.layer_rule({
  name = "noctalia",
  match = { namespace = "noctalia-background-.*$" },
  ignore_alpha = 0.5,
  blur = true,
  blur_popups = true,
})
