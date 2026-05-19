-- make odd workspaces use the scrolling layout

for _, i in pairs({ "1", "3", "5", "7", "9" }) do
  hl.workspace_rule({
    workspace = i,
    layout = "scrolling",
  })
end
