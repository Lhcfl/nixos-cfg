export def "from nix" [] {
  let file = (mktemp --tmpdir --suffix ".nix")

  $in | save -f $file

  try {
    nix eval --file $file --raw --apply '
      let
        sanitize = x:
          let t = builtins.typeOf x;
          in if t == "set" then
               builtins.mapAttrs (_: sanitize) x
             else if t == "list" then
               map sanitize x
             else if t == "lambda" then
               let
                 args = builtins.attrNames (builtins.functionArgs x);
               in "<lambda {" + builtins.concatStringsSep ", " args + "}>"
             else
               x;
      in x: builtins.toJSON (sanitize x)
    ' | from json
  } finally {
    rm -f $file
  }
}