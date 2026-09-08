{ config, ... }:
let
  inherit (config.funkcia.hm.gui.wm-keybinding.utils) mkBind;
in
{
  funkcia.hm.gui.wm-keybinding = {
    niri.enable = true;

    binds = map (x: x // { allow-when-locked = true; }) [
      (mkBind [ "XF86AudioMute" ] "spawn" [
        "wpctl"
        "set-mute"
        "@DEFAULT_AUDIO_SINK@"
        "toggle"
      ])
      (mkBind [ "XF86AudioMicMute" ] "spawn" [
        "wpctl"
        "set-mute"
        "@DEFAULT_AUDIO_SOURCE@"
        "toggle"
      ])
      (mkBind [ "XF86AudioLowerVolume" ] "spawn" [
        "wpctl"
        "set-volume"
        "@DEFAULT_AUDIO_SINK@"
        "5%-"
      ])
      (mkBind [ "XF86AudioRaiseVolume" ] "spawn" [
        "wpctl"
        "set-volume"
        "@DEFAULT_AUDIO_SINK@"
        "5%+"
      ])
      (mkBind [ "XF86AudioPlay" ] "spawn" [
        "playerctl"
        "play-pause"
      ])
      (mkBind [ "XF86AudioPause" ] "spawn" [
        "playerctl"
        "play-pause"
      ])
      (mkBind [ "XF86AudioNext" ] "spawn" [
        "playerctl"
        "next"
      ])
      (mkBind [ "XF86AudioPrev" ] "spawn" [
        "playerctl"
        "previous"
      ])
    ];
  };
}
