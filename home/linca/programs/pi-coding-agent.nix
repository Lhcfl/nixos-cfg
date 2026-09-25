{
  pkgs,
  config,
  lib,
  ...
}:
{
  config = lib.mkIf (config.linca.work.enable) (
    lib.mkMerge [
      {
        home.packages = [
          pkgs.funkcia.commit
        ];

        funkcia.hm.programs.pi = {
          enable = true;
          settings.packages = [
            "pi-skills"
            "npm:@xynogen/pix-sudo"
            "npm:@monopi/extension-shell-format"
            "npm:pi-agent-browser-native"
            "npm:pi-background-tasks@latest"
            "npm:@pi-unipi/notify"
            "npm:@agnishc/edb-session-manager"
            "npm:pi-interactive-shell"
            "npm:pi-commandcode-provider"
          ];
        };
      }

      (lib.mkIf (config.linca.sops.enable) {
        sops.secrets.deepseek-api-key = { };
        sops.secrets.zai-cn-api-key = { };
        sops.secrets.mimo-api-key = { };
        sops.secrets.command-code-api-key = { };

        funkcia.hm.programs.pi.auth = {
          deepseek = {
            type = "api_key";
            key-path = config.sops.secrets."deepseek-api-key".path;
          };
          zai-coding-cn = {
            type = "api_key";
            key-path = config.sops.secrets."zai-cn-api-key".path;
          };
          xiaomi = {
            type = "api_key";
            key-path = config.sops.secrets."mimo-api-key".path;
          };
          command-code = {
            type = "api_key";
            key-path = config.sops.secrets."command-code-api-key".path;
          };
        };
      })
    ]
  );
}
