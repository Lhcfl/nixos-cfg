let tasks = [
    {
        name: "format:markdown"
        check: { dprint check ...(fd -e md | lines) }
        fix: { dprint fmt ...(fd -e md | lines) }
    }
    {
        name: "format:nix"
        check: { nixfmt -c ...(fd -e nix | lines) }
        fix: { nixfmt ...(fd -e nix | lines) }
    }
    {
        name: "lint:nix"
        check: { statix check }
        fix: { statix fix }
    }
]

def main [
    --fix (-f) # auto fix errors
] {
    let bad = $tasks 
    | par-each { |x| do (if $fix { $x.fix } else { $x.check }) | complete | insert name $x.name }
    | where exit_code != 0
    
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

            print $"In job ($x.name):\n\t($x.stdout | indented)\n\t($x.stderr | indented)"
            print "-------------------"
        }

        let tmp = mktemp --suffix .json
    
        $bad 
        | to json
        | save -f $tmp
        | print $"Full report saved to ($tmp)"
    }
}
