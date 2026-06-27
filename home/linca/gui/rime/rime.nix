{
  inputs,
  pkgs,
  lib,
  ...
}:
let
  rime-dir = file: ".local/share/fcitx5/rime/${file}";
  yaml = pkgs.formats.yaml { };

  source =
    src:
    (lib.pipe src [
      builtins.readDir
      builtins.attrNames
      (builtins.filter (
        name: (lib.hasSuffix ".yaml" name) || (lib.hasSuffix ".txt" name) || name == "opencc"
      ))
      (map (name: {
        name = rime-dir name;
        value.source = "${src}/${name}";
      }))
      builtins.listToAttrs
    ]);

  patch =
    schema:
    (lib.pipe schema [
      (map (schema: {
        name = rime-dir "${schema}.custom.yaml";
        value.source = yaml.generate "${schema}.custom.yaml" {
          patch.__include = "emoji_suggestion:/patch";
        };
      }))
      builtins.listToAttrs
    ]);

in
{
  home.file = lib.mkMerge [
    (source ./rime-config)
    (source inputs.rime.rime-luna-pinyin)
    (source inputs.rime.rime-essay)
    (source inputs.rime.rime-emoji)
    (patch [
      "luna_pinyin"
      "luna_pinyin_simp"
      "luna_pinyin_tw"
    ])
  ];
}
