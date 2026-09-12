{ config, lib, ... }: {
  options.funkcia.server = {
    domain.suffix = lib.mkOption {
      type = lib.types.str;
    };

    domains = lib.mkOption {
      type = lib.types.attrsOf (
        lib.types.submodule (
          { name, ... }: {
            options.value = lib.mkOption {
              type = lib.types.str;
              default = "${name}.${config.funkcia.server.domain.suffix}";
              defaultText = lib.literalMD "`<name>.<funkcia.server.domain.suffix>`";
            };
          }
        )
      );
    };
  };
}
