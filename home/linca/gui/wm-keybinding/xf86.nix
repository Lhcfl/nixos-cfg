{ lib, ... }:
{
  funkcia.hm.gui.wm-keybinding = {
    binds = lib.mapAttrs (_: x: x // { allow-when-locked = true; }) {
      "XF86AudioMute".actions.spawn-sh = lib.mkDefault "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
      "XF86AudioMicMute".actions.spawn-sh = lib.mkDefault "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle";
      "XF86AudioLowerVolume".actions.spawn-sh = lib.mkDefault "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-";
      "XF86AudioRaiseVolume".actions.spawn-sh = lib.mkDefault "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+";
      "XF86AudioPlay".actions.spawn-sh = lib.mkDefault "playerctl play-pause";
      "XF86AudioPause".actions.spawn-sh = lib.mkDefault "playerctl play-pause";
      "XF86AudioNext".actions.spawn-sh = lib.mkDefault "playerctl next";
      "XF86AudioPrev".actions.spawn-sh = lib.mkDefault "playerctl previous";
      "XF86MonBrightnessUp".actions.spawn-sh = lib.mkDefault "brightnessctl set 5%+";
      "XF86MonBrightnessDown".actions.spawn-sh = lib.mkDefault "brightnessctl set 5%-";
    };
  };
}
