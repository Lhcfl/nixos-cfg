_: {
  security.pam.services = {
    login.fprintAuth = true;
    sudo.fprintAuth = true;
    polkit-1.fprintAuth = true;
    # 如果你用 swaylock / gtklock 等
    # swaylock.fprintAuth = true;
  };
}
