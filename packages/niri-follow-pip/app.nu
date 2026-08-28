niri msg -j event-stream
| lines
| each { from json }
| where {|event| $event.WorkspaceActivated? != null and $event.WorkspaceActivated.focused == true }
| each {|event|
    let id = $event.WorkspaceActivated.id
    let idx = niri msg -j workspaces | from json | where id == $event.WorkspaceActivated.id | first | get "idx"

    if $idx == null {
        return null 
    }

    print $"workspace activated id=($id) idx=($idx)"

    niri msg -j windows
    | from json
    | where title == "Picture-in-Picture"
    | each {|w|
        print $"call niri msg action move-window-to-workspace --window-id ($w.id) ($idx)"
        niri msg action move-window-to-workspace --window-id $w.id $idx
    }

    null
}