{
  inputs,
  lib,
  pkgs,
  ...
}:
let
  inherit (inputs.plum-nix.patchUtils lib) replace append mkPatch;
in
{
  plum-nix = {
    enable = true;
    type = "fcitx5";

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
      punctuator.half_shape."#" = replace { commit = "#"; };
    };
  };

  # home.activation.rime =
  #   let
  #     rimeDir = ".local/share/fcitx5/rime";
  #   in
  #   lib.hm.dag.entryAfter [ "writeBoundary" ] ''
  #     ${pkgs.librime}/bin/rime_deployer --build $HOME/${rimeDir}
  #   '';
}
