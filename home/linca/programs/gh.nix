{
  lib,
  config,
  ...
}:
{
  config = lib.mkIf config.linca.work.enable {
    programs.gh = {
      enable = true;
      gitCredentialHelper.enable = true;

      settings = {
        # What protocol to use when performing git operations.
        git_protocol = "https";
        # When to interactively prompt. This is a global config that cannot be overridden by hostname.
        prompt = "enabled";
        # Aliases allow you to create nicknames for gh commands
        aliases.co = "pr checkout";
        # Whether to display labels using their RGB hex color codes in terminals that support truecolor.
        color_labels = "enabled";
        # Whether to use a animated spinner as a progress indicator. If disabled, a textual progress indicator is used instead.
        spinner = "enabled";
      };
    };
  };
}
