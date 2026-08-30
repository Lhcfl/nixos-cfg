{
  osConfig,
  lib,
  ...
}:
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
      }

      (lib.mkIf ((osConfig.networking.proxy.default or null) != null) {
        http.proxy = osConfig.networking.proxy.default;
        https.proxy = osConfig.networking.proxy.default;
      })
    ];
  };
}
