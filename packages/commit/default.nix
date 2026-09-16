{ ... }:
let
  name = "commit";
in
{
  perSystem = { pkgs, config, ... }: {
    packages.${name} = (pkgs.writers.writeNuBin name {
      makeWrapperArgs = [
        "--prefix"
        "PATH"
        ":"
        (pkgs.lib.makeBinPath [ pkgs.git pkgs.pi-coding-agent ])
      ];
    } ./app.nu).overrideAttrs (old: {
      meta = old.meta // {
        description = "根据当前 git 仓库状态用 pi 生成 commit message 并提交";
      };
    });
    overlayAttrs.${name} = config.packages.${name};
  };
}
