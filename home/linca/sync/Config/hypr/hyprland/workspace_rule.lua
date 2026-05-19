for _, i in pairs({ "1", "5" }) do
  hl.workspace_rule({
    workspace = i,
    layout = "scrolling",
    layout_opts = { column_width = 0.6667 }
  })
end
