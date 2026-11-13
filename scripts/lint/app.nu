def get-tasks () {
    [
        {
            name: "format:markdown"
            description: "format markdown files"
            check: { dprint check ...(fd -e md | lines) }
            fix: { dprint fmt ...(fd -e md | lines) }
        }
        {
            name: "format:nix"
            description: "format nix files"
            check: { nixfmt -c ...(fd -e nix | lines) }
            fix: { nixfmt ...(fd -e nix | lines) }
        }
        {
            name: "lint:nix"
            description: "lint check for nix files"
            check: { statix check }
            fix: { statix fix }
        }
        {
            name: "content:readme-tree"
            description: "check the tree of README.md"
            check: { nu scripts/lint/tasks/readme-tree.nu --check }
            fix: { nu scripts/lint/tasks/readme-tree.nu }
        }
        {
            name: "content:docs.md"
            description: "check the content of README.md"
            check: null
            fix: { 
                let path = nix build --print-out-paths .#funkcia-options-doc-md --offline
                open $path | save -f docs.md
            }
        }
    ]
}

def main [
    --fix (-f) # auto fix errors
] {
    def do-jobs [c] { 
        if ($fix) {
            get-tasks | each $c
        } else {
            get-tasks | par-each $c
        }
    }

    let bad = do-jobs { |x| try {
        $env.config.use_ansi_coloring = false
        cd $"($env.FILE_PWD)/../.."
        let todo = if $fix { $x.fix } else { $x.check }
        if ($todo == null) {
            print $"[SKIP] ($x.name)"
            return { ok: true }
        }
        do $todo
        print $"[OK] ($x.name)"
        return { ok: true }
    } catch { |err|
        return { ok: false, err: $err.msg, name: $x.name }
    }}
    | where ok == false
    
    if ($bad | is-not-empty) {
        for x in $bad {
            def indented [] {
                let x = $in | lines
                if ($x | length) > 10 {
                    [...($x | first 10), "", $"\(...skipped (($x | length) - 10) lines\)", ""]
                } else {
                    $x
                } | str join "\n\t"
            }

            print $"[lint] In job ($x.name):\n\t($x.err | indented)"
            print "-------------------"
        }

        let tmp = mktemp --suffix .json
    
        $bad 
        | to json
        | save -f $tmp
        | print $"Full report saved to ($tmp)"
    } else {
        print "All checks or fixes passed!"
    }
}
