def main [
    --check (-c)
] {
    let metadatas = fd README.md 
    | lines 
    | each { |x| open | first | { ...$in, path: ($x | str replace "README.md" "") } }
    | where element == yaml
    | select path content
    | each { update content { from yaml } }

    let table = $metadatas 
    | update path { $"[`($in)`]\(($in)\)" }
    | update content { get description }
    | rename path description
    | table --theme markdown --width 500

    let st = "<!-- BEGIN_GEN_README_TREE -->"
    let ed = "<!-- END_GEN_README_TREE -->"

    let oldfile = open README.md --raw
    let newfile = $oldfile | str replace -r $"($st)[\\s\\S]+?($ed)" $"($st)\n\n($table)\n\n($ed)"

    if ($check) {
        if ($oldfile != $newfile) {
            print "please regenerate README.md tree"
            return 1
        }
    } else {
        $newfile | save -f README.md
    }
}