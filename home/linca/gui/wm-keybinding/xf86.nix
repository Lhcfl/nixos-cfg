{ lib, ... }:
{
  funkcia.hm.gui.wm-keybinding = {
    binds = lib.mapAttrs (_: x: x // { allow-when-locked = true; }) {
      "XF86AudioMute".actions.spawn = [
        "wpctl"
        "set-mute"
        "@DEFAULT_AUDIO_SINK@"
        "toggle"
      ];
      "XF86AudioMicMute".actions.spawn = [
        "wpctl"
        "set-mute"
        "@DEFAULT_AUDIO_SOURCE@"
        "toggle"
      ];
      "XF86AudioLowerVolume".actions.spawn = [
        "wpctl"
        "set-volume"
        "@DEFAULT_AUDIO_SINK@"
        "5%-"
      ];
      "XF86AudioRaiseVolume".actions.spawn = [
        "wpctl"
        "set-volume"
        "@DEFAULT_AUDIO_SINK@"
        "5%+"
      ];
      "XF86AudioPlay".actions.spawn = [
        "playerctl"
        "play-pause"
      ];
      "XF86AudioPause".actions.spawn = [
        "playerctl"
        "play-pause"
      ];
      "XF86AudioNext".actions.spawn = [
        "playerctl"
        "next"
      ];
      "XF86AudioPrev".actions.spawn = [
        "playerctl"
        "previous"
      ];
    };
  };
}
