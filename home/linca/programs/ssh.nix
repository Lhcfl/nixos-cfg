_: {
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    includes = [ "config.d/*" ];
    settings = {
      "*" = {
        addKeysToAgent = "yes";
        serverAliveInterval = 30;
        userKnownHostsFile = "~/.ssh/known_hosts";
      };
    };
  };
}
