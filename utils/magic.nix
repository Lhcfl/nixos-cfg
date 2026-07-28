{ lib, ... }: {
  # patch 一个模块使得它被添加上额外的内容。
  # (Args -> Module -> Partial Module) -> Module -> Module
  # usage: patch ./modules/xxx.nix ({ config, lib, ... }: module: { config = lib.mkIf config.xxx.enable module.config })
  patchModule =
    patcher: source:
    let
      resolveModule =
        x:
        let
          type = builtins.typeOf x;
        in
        if type == "lambda" then
          x
        else if type == "set" then
          _: x
        else if type == "path" then
          resolveModule (import x)
        else
          throw (builtins.trace x "unknow module");

      moduleFn = resolveModule source;

      mergeArgs =
        fs:
        lib.pipe fs [
          (map builtins.functionArgs)
          (map lib.attrsToList)
          (builtins.concatLists)
          lib.listToAttrs
        ];

      wrap =
        f:
        lib.setFunctionArgs f (mergeArgs [
          moduleFn
          patcher
        ]);
    in
    wrap (
      args:
      let
        content = moduleFn args;

        module = {
          options = if content ? "options" then content.options else { };
          config = if content ? "config" then content.config else content;
        };
      in
      module // (patcher args module)
    );
}
