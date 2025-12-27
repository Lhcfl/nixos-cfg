# 指纹识别模块

{ pkgs, ... }:
{
  # the driver
  services.fprintd = {
    enable = true;

    # If simply enabling fprintd is not enough, try enabling fprintd.tod...
    tod.enable = true;
    # ...and use one of the next four drivers
    # tod.driver = pkgs.libfprint-2-tod1-goodix; # Goodix driver module
    tod.driver = pkgs.libfprint-2-tod1-elan; # Elan(04f3:0c4b) driver
    # tod.driver = pkgs.libfprint-2-tod1-vfs0090; # (Marked as broken as of 2025/04/23!) driver for 2016 ThinkPads
    # tod.driver = pkgs.libfprint-2-tod1-goodix-550a; # Goodix 550a driver (from Lenovo)

    # however for focaltech 2808:a658, use fprintd with overidden package (without tod)
    # package = pkgs.fprintd.override {
    #   libfprint = pkgs.libfprint-focaltech-2808-a658;
    # };
  };

  security = {
    polkit.enable = true;

    polkit.extraConfig = ''
      polkit.addRule(function(action, subject) {
        if (action.id == "net.reactivated.fprint.device.enroll" &&
            subject.isInGroup("users")) {
          return polkit.Result.YES;
        }
      });
    '';

    pam.services = {
      login.fprintAuth = true;
      sudo.fprintAuth = true;
      polkit-1.fprintAuth = true;
      # 如果你用 swaylock / gtklock 等
      # swaylock.fprintAuth = true;
    };

  };
}
