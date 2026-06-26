{
  osConfig,
  pkgs,
  lib,
  ...
}:
{
  programs.git = lib.mkMerge [
    {
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
      };
    }
    (
      let
        githubUrls = [
          "https://github.com"
          "https://gist.github.com"
        ];
      in
      {
        settings = lib.listToAttrs (
          lib.map (
            url:
            lib.nameValuePair "credential \"${url}\"" {
              helper = "${lib.getExe pkgs.gh} auth git-credential";
            }
          ) githubUrls
        );
      }
    )
  ];
}
