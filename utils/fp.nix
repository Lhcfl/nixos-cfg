_: {
  pipe =
    list:
    let
      init = builtins.head list;
      funcs = builtins.tail list;
    in
    builtins.foldl' (x: f: f x) init funcs;
}
