_: {
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    settings = {
      "*" = {
        addKeysToAgent = "yes";
        serverAliveInterval = 30;
        userKnownHostsFile = "~/.ssh/known_hosts";
      };
    };
  };
}
