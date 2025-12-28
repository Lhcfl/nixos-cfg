_: {

  programs.git = {
    enable = true;
    settings = {
      init = {
        defaultBranch = "main";
      };
      user = {
        mame = "linca";
        email = "lhcfl@outlook.com";
      };
    };
  };
}
