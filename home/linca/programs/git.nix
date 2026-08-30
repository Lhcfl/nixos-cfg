{
  osConfig,
  pkgs,
  lib,
  ...
}:
let
  ghHelper = "${lib.getExe pkgs.gh} auth git-credential";
  credential = url: "credential \"${url}\"";
in
{
  programs.git = {
    enable = true;
    settings = lib.mkMerge [
      {
        init = {
          defaultBranch = "main";
        };
        user = {
          name = "linca";
          email = "lhcfl@outlook.com";
        };
        ${credential "https://github.com"}.helper = ghHelper;
        ${credential "https://gist.github.com"}.helper = ghHelper;
      }

      (lib.mkIf ((osConfig.networking.proxy.default or null) != null) {
        http.proxy = osConfig.networking.proxy.default;
        https.proxy = osConfig.networking.proxy.default;
      })
    ];
  };
}
