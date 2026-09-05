{
  config,
  lib,
  pkgs,
  ...
}:
{
  # options.funkcia.hm.opencode.enable = lib.mkEnableOption "opencode";
  # config = lib.mkIf config.funkcia.hm.opencode.enable {
  # };

  config = lib.mkMerge [
    {
      programs.opencode = {
        enable = true;
        settings = {
          plugin = [ "superpowers@git+https://github.com/obra/superpowers.git" ];
          provider.agent-router = {
            name = "Agent Router";
            npm = "@ai-sdk/openai-compatible";
            options.baseURL = "https://agentrouter.org/v1";
            models = {
              claude-opus-4-8 = {
                name = "claude-opus-4-8";
              };
              claude-opus-5 = {
                name = "claude-opus-5";
              };
              "gpt-5.6-sol" = {
                name = "gpt-5.6-sol";
              };
            };
          };
        };
        tui = {
          theme = "system";
        };
        web.enable = true;
      };
    }
    (lib.mkIf config.linca.sops.enable (
      let
        env_path = config.sops.templates."opencode_server_env".path;
      in
      {
        sops.secrets."opencode_server/username" = { };
        sops.secrets."opencode_server/password" = { };

        sops.templates."opencode_server_env".content = ''
          OPENCODE_SERVER_USERNAME=${config.sops.placeholder."opencode_server/username"}
          OPENCODE_SERVER_PASSWORD=${config.sops.placeholder."opencode_server/password"}
        '';

        programs.opencode.web.environmentFile = env_path;

        home.packages = [
          (pkgs.writeShellApplication {
            name = "opencode-attach";
            runtimeInputs = with pkgs; [
              dotenv-cli
            ];
            text = ''
              dotenv -e ${env_path} -- opencode attach "http://localhost:4096" --dir "$(pwd)" "$@"
            '';
          })
        ];
      }
    ))
  ];
}
