{
  osConfig,
  pkgs,
  lib,
  ...
}:
let
  ghHelper = "${lib.getExe pkgs.gh} auth git-credential";
in
{
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
      http.proxy = osConfig.networking.proxy.default;
      https.proxy = osConfig.networking.proxy.default;
      "credential \"https://github.com\"" = {
        helper = ghHelper;
      };
      "credential \"https://gist.github.com\"" = {
        helper = ghHelper;
      };
    };
  };
}
