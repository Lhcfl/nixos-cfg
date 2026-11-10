{
  lib,
  osConfig ? null,
  funkcia-utils,
  ...
}:
{
  options.funckia.install-dir = lib.mkOption {
    description = "整个配置文件夹被安装在哪里";
    type = lib.types.str;
    default = toString (osConfig.funkcia.install-dir or (funkcia-utils.projectPath ./.));
    defaultText = lib.literalExpression ''
      toString (osConfig.funkcia.install-dir or (funkcia-utils.projectPath ./.))
    '';
  };
}
