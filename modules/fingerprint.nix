_: {
  services.fprintd.enable = true;

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
