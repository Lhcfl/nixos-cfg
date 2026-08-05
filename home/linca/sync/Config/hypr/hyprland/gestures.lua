-- Converted from gestures.conf
-- https://wiki.hypr.land/Configuring/Gestures

hl.gesture({
  fingers = 3,
  direction = "vertical",
  action = "workspace",
})

hl.gesture({
  fingers = 3,
  direction = "horizontal",
  action = "scroll_move",
  -- action = "workspace",
})
--
-- hl.gesture({
--   fingers = 3,
--   direction = "swipe",
--   action = "resize",
-- })
--
hl.gesture({
  fingers = 3,
  direction = "swipe",
  mods = "SUPER",
  action = "resize",
})
