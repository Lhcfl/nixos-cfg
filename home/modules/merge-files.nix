{
  this,
  lib,
  config,
  pkgs,
  ...
}:
{
  this.options = lib.mkOption {
    type = lib.types.attrsWith {
      placeholder = "path";
      elemType = lib.types.json;
    };
    default = { };
    description = ''
      使用 nushell 的 merge deep 命令将 Nix 生成的 JSON 文件与指定 path 的文件进行深度合并。
    '';
  };

  config.home.activation = lib.mapAttrs' (
    path: json:
    let
      normalizedName = lib.replaceStrings [ "/" ] [ "__" ] path;
      dest = "${config.home.homeDirectory}/${path}";
      settings = pkgs.writeText normalizedName (builtins.toJSON json);
    in
    {
      name = "merge-${normalizedName}";
      value = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
        ${lib.getExe pkgs.nushell} -c \
          "try { open ${dest} } catch {{}} | merge deep (open ${settings}) | save --force ${dest}"
      '';
    }
  ) this.config;
}
