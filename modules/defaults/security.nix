_: {
  security = {
    sudo-rs.enable = true;
    polkit = {
      enable = true;
      enablePkexecWrapper = true;
    };
  };
}
