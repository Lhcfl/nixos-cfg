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
          ];
        };
      }

      (lib.mkIf (config.linca.sops.enable) (
        let
          template-name = "pi-auth-json";
        in
        {
          sops.secrets.deepseek-api-key = { };
          sops.secrets.zai-cn-api-key = { };

          sops.templates.${template-name}.content = builtins.toJSON {
            deepseek = {
              type = "api_key";
              key = config.sops.placeholder."deepseek-api-key";
            };
            zai-coding-cn = {
              type = "api_key";
              key = config.sops.placeholder."zai-cn-api-key";
            };
          };

          home.file.".pi/agent/auth.json".source =
            config.lib.file.mkOutOfStoreSymlink
              config.sops.templates.${template-name}.path;
        }
      ))
    ]
  );
}
