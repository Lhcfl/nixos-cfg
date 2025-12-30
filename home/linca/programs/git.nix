_: {

  programs.git = {
    enable = true;
    settings = {
      init = {
        defaultBranch = "main";
      };
      user = {
        name = "linca";
        email = "lhcfl@outlook.com";
      };
    };
  };
}
