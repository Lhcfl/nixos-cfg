$env.config.use_ansi_coloring = false
cd $"($env.FILE_PWD)/../.."

print $"pwd = (pwd)"

let metadatas = fd README.md 
| lines 
| each { |x| open | first | { ...$in, path: ($x | str replace "README.md" "") } }
| where element == yaml
| select path content
| each { update content { from yaml } }

let table = $metadatas 
| update path { $"[`($in)`]\(($in)README.md\)" }
| update content { get description }
| rename path description
| table --theme markdown --width 500

print $table

let st = "<!-- BEGIN_GEN_README_TREE -->"
let ed = "<!-- END_GEN_README_TREE -->"

open README.md --raw | str replace -r $"($st)[\\s\\S]+?($ed)" $"($st)\n\n($table)\n\n($ed)" | save README.md -f