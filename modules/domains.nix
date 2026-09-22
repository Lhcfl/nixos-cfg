{ config, lib, ... }: {
  options.funkcia.os = {
    domain.suffix = lib.mkOption {
      type = lib.types.str;
    };

    domains = lib.mkOption {
      type = lib.types.attrsOf (
        lib.types.submodule (
          { name, ... }: {
            options.value = lib.mkOption {
              type = lib.types.str;
              default = "${name}.${config.funkcia.os.domain.suffix}";
              defaultText = lib.literalMD "`<name>.<funkcia.os.domain.suffix>`";
            };
          }
        )
      );
    };
  };
}
