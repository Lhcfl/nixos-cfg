export def main [up: bool] {
    let windows =  niri msg -j windows | from json
 
    let active = $windows | where is_focused | first

    if ($active == null) {
        if ($up) {
            niri msg action focus-workspace-up
        } else {
            niri msg action focus-workspace-down
        }
    } else if ($up) {
        if ($active.layout.pos_in_scrolling_layout.1 == 1) {
            niri msg action focus-workspace-up
        } else {
            niri msg action focus-window-up
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
            niri msg action focus-window-down
        } else {
            niri msg action focus-workspace-down
        }
    }
}