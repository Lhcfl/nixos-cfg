{
  config,
  lib,
  ...
}:
{
  config = lib.mkIf (config.linca.work.enable) (
    lib.mkMerge [
      {
        funkcia.hm.programs.pi = {
          enable = true;
          settings.packages = [
            "npm:@xynogen/pix-sudo"
            "npm:@monopi/extension-shell-format"
            "npm:pi-agent-browser-native"
            "npm:pi-background-tasks@latest"
          ];
        };
      }

      (lib.mkIf (config.linca.sops.enable) {
        sops.secrets.deepseek-api-key = { };
        sops.secrets.zai-cn-api-key = { };

        funkcia.hm.programs.pi.auth = {
          deepseek = {
            type = "api_key";
            key-path = config.sops.secrets."deepseek-api-key".path;
          };
          zai-coding-cn = {
            type = "api_key";
            key-path = config.sops.secrets."zai-cn-api-key".path;
          };
        };
      })
    ]
  );
}
