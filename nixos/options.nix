{
  lib,
  funkcia-utils,
  ...
}:
{
  options.funkcia.install-dir = lib.mkOption {
    description = "整个配置文件夹被安装在哪里";
    type = lib.types.str;
    default = toString funkcia-utils.projectPath ./.;
    defaultText = lib.literalExpression "toString funkcia-utils.projectPath ./.";
  };
}
