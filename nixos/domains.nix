{ config, lib, ... }: {
  options.funkcia.os = {
    domain.suffix = lib.mkOption {
      description = "域名后缀";
      type = lib.types.str;
    };

    domains = lib.mkOption {
      description = "域名前缀对应的实际域名列表";
      type = lib.types.attrsOf (
        lib.types.submodule (
          { name, ... }: {
            options.value = lib.mkOption {
              type = lib.types.str;
              default = "${name}.${config.funkcia.os.domain.suffix}";
              defaultText = lib.literalMD "`<name>.<funkcia.os.domain.suffix>`";
              description = "实际的域名";
            };
          }
        )
      );
    };
  };
}
