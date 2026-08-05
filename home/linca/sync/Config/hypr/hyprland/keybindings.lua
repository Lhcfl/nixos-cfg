local terminal = "kitty"
local browser = "firefox"

---@param main_mod string
---@param cb fun(bind: fun(keys: string, dispatcher: HL.Dispatcher|function, opts?: HL.BindOptions): HL.Keybind)
local function with_main_mod(main_mod, cb)
  cb(function(key, ...)
    return hl.bind(main_mod .. " + " .. key, ...)
  end)
end

hl.bind("CTRL + ALT + T", hl.dsp.exec_cmd(terminal), { submap_universal = true })

with_main_mod("SUPER", function(mbind)
  -- Scroll through existing workspaces with mainMod + scroll
  mbind("mouse_down", hl.dsp.focus({ workspace = "e+1" }))
  mbind("mouse_up", hl.dsp.focus({ workspace = "e-1" }))

  -- Move/resize windows with mainMod + LMB/RMB and dragging
  mbind("mouse:272", hl.dsp.window.drag(), { mouse = true })
  mbind("mouse:273", hl.dsp.window.resize(), { mouse = true })

  -- Applications
  mbind("F", hl.dsp.exec_cmd("vicinae toggle"))
  mbind("E", hl.dsp.exec_cmd("xdg-open ~"))
  mbind("C", hl.dsp.exec_cmd("code"))
  mbind("B", hl.dsp.exec_cmd(browser))
  -- hl.bind("XF86Favorites", hl.dsp.exec_cmd("keepassxc"))
  -- mbind("R", hl.dsp.exec_cmd("hyprctl reload"))

  -- Window management
  mbind("Q", hl.dsp.window.close())
  hl.bind("ALT + F4", hl.dsp.window.close())
  mbind("Delete", hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))
  mbind("SHIFT + F", hl.dsp.window.float())

  mbind("F11", hl.dsp.window.fullscreen())
  -- 任意选择大小
  mbind("P", hl.dsp.window.pseudo())
  mbind("J", hl.dsp.layout("togglesplit"))
  mbind("R", hl.dsp.layout("colresize +conf"))

  for _, key in pairs({ "Left", "Right", "Up", "Down" }) do
    local direction = key:lower()
    mbind("" .. key, hl.dsp.focus({ direction = direction }))
    mbind("SHIFT + " .. key, hl.dsp.window.swap({ direction = direction }))
  end

  -- Workspace navigation
  for i = 1, 10 do
    local key = "" .. i % 10
    mbind(key, hl.dsp.focus({ workspace = i }))
    mbind("SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
    mbind("ALT + " .. key, hl.dsp.window.move({
      workspace = i,
      follow = false,
    }))
  end

  -- Special workspace (scratchpad)
  mbind("SHIFT + S", hl.dsp.window.move({ workspace = "special" }))
  mbind("ALT + S", hl.dsp.window.move({ workspace = "special", follow = false }))
  mbind("S", hl.dsp.workspace.toggle_special("magic"))

  -- new empty workspace
  mbind("N", hl.dsp.focus({ workspace = "empty" }))
  mbind("SHIFT + N", hl.dsp.window.move({ workspace = "empty" }))
  mbind("TAB", hl.dsp.focus({ workspace = "previous" }))

  mbind("ALT + Left", hl.dsp.window.move({ workspace = "-1" }))
  mbind("ALT + Right", hl.dsp.window.move({ workspace = "+1" }))
  mbind("SHIFT + X", hl.dsp.window.move({ workspace = "99" }))
end)

with_main_mod("SUPER + CTRL", function(mbind)
  mbind("T", hl.dsp.group.toggle())
  mbind("L", hl.dsp.group.lock())
  mbind("Left", hl.dsp.group.prev())
  mbind("Right", hl.dsp.group.next())
end)

-- Screen capture
hl.bind("Print", hl.dsp.exec_cmd("gradia --screenshot"))
hl.bind("CTRL + ALT + A", hl.dsp.exec_cmd("grim -g \"$(slurp)\" -t png - | wl-copy -t image/png"))

-- Focus navigation
hl.bind("ALT + Tab", hl.dsp.window.cycle_next())

-- Hardware controls
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), { locked = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
  { locked = true, repeating = true })
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"),
  { locked = true, repeating = true })

hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),
  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),
  { locked = true, repeating = true })
