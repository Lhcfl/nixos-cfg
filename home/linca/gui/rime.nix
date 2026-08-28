{
  inputs,
  lib,
  ...
}:
let
  # inherit (inputs.plum-nix.patchUtils lib) replace append mkPatch;
  inherit (inputs.plum-nix.patchUtils lib) replace mkPatch;
in
{
  plum-nix = {
    enable = true;
    type = "fcitx5";

    schemas = [
      "luna_pinyin_simp"
      "luna_pinyin"
      "luna_pinyin_tw"
    ];

    patch = mkPatch {
      switcher.hotkeys = replace [ "F4" ];
      menu.page_size = replace 9;
      key_binder.bindings = replace {
        __patch = [
          "key_bindings:/move_by_word_with_tab"
          "key_bindings:/paging_with_brackets"
          "key_bindings:/numbered_mode_switch"
        ];
      };
    };

    customize.symbols = mkPatch {
      punctuator.half_shape = {
        "#" = replace { commit = "#"; };
        "[" = replace { commit = "「"; };
        "]" = replace { commit = "」"; };
        "{" = replace { commit = "{"; };
        "}" = replace { commit = "}"; };
        # "=" = replace { commit = "="; };
        # "`" = replace { commit = "·"; };
        # "*" = replace { commit = "*"; };
        "`" = replace "·";
        "*" = replace "*";
      };
    };
  };
}
