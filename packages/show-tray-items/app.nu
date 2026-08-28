export def main [] {
    (busctl -j --user get-property
        org.kde.StatusNotifierWatcher
        /StatusNotifierWatcher
        org.kde.StatusNotifierWatcher
        RegisteredStatusNotifierItems) 
    | from json
    | get data
    | each { |item| try {
        let s = split row "/"
        let bus = $s | first
        let path = "/" + ($s | skip 1 | str join "/")
        let app = busctl -j --user get-property $bus $path org.kde.StatusNotifierItem Id | from json | get data
        { ok: true, app: $app, bus: $bus, path: $path }
    } catch { |err|
        { ok: false, err: $err.rendered }
    }}
}