{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:
{
  config = lib.mkIf config.funkcia.hm.gui.enable {
    programs.vscode =
      let
        # 使用 nix-vscode-extensions 获取更多扩展
        vscode-exts =
          (import inputs.nixpkgs {
            system = pkgs.stdenv.hostPlatform.system;
            config.allowUnfree = true;
            overlays = [ inputs.nix-vscode-extensions.overlays.default ];
          }).nix-vscode-extensions;

        common-extensions = with vscode-exts.vscode-marketplace; [
          eamodio.gitlens
          tamasfe.even-better-toml
          redhat.vscode-yaml
          jnoortheen.nix-ide # we are using nix a lot
        ];

        # 兼容性问题
        common-pkg-extensions = with pkgs.vscode-extensions; [
          github.copilot
          github.copilot-chat
        ];

        callProfile =
          src:
          let
            source = import src { inherit pkgs lib vscode-exts; };
          in
          {
            inherit (source) userSettings;
            extensions = builtins.concatLists [
              common-extensions
              common-pkg-extensions
              source.extensions
            ];
          };
      in
      {
        enable = true;

        profiles = {
          default = callProfile ./profiles/default.nix;
          cangjie = callProfile ./profiles/cangjie.nix;
          ts = callProfile ./profiles/ts.nix;
        };
      };
  };
}
