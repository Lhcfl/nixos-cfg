export def main [
    up: bool
    --move (-m)  
] {
    let windows =  niri msg -j windows | from json
 
    let active = $windows | where is_focused | first

    mut kind = "workspace";

    if ($active == null) {
        $kind = "workspace"
    } else if ($up) {
        if ($active.layout.pos_in_scrolling_layout.1 == 1) {
            $kind = "workspace"
        } else {
            $kind = "window"
        }
    } else {
        let has_other = $windows
        | where $in.workspace_id == $active.workspace_id
        | get layout | get pos_in_scrolling_layout
        | where $in.0 == $active.layout.pos_in_scrolling_layout.0
        | where $in.1 > $active.layout.pos_in_scrolling_layout.1
        | length
        | $in > 0

        if ($has_other) {
            $kind = "window"
        } else {
            $kind = "workspace"
        }
    }

    let actions = [
        "focus-workspace-up"
        "focus-workspace-down"
        "focus-window-up"
        "focus-window-down"
        "move-window-to-workspace-up"
        "move-window-to-workspace-down"
        "move-window-up"
        "move-window-down"
    ]

    let idx = [
        ($move)
        ($kind == "window")
        (not $up)
    ] | reduce --fold 0 {|el, acc| $acc * 2 + ($el | into int) }

    niri msg action ($actions | get $idx)
}