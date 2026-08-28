export def "from nix" [] {
  try {
    nix eval --impure --file /dev/stdin --raw --apply '
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
  }
}

export def "to nix" [] {
  $in | to json  | nix eval -E "builtins.fromJSON (builtins.readFile \"/dev/stdin\")" --impure
}