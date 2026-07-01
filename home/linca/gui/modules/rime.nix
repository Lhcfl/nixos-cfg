_: {
  plum-nix = {
    enable = true;
    type = "fcitx5";

    patch = {
      "switcher/hotkeys" = [ "F4" ];
      "menu/page_side" = 9;

      "key_binder/bindings".__patch = [
        "key_bindings:/move_by_word_with_tab"
        "key_bindings:/paging_with_brackets"
        "key_bindings:/numbered_mode_switch"
      ];
    };
  };
}
