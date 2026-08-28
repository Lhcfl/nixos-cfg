{ ... }:
let
  name = "niri-follow-pip";
in
{
  perSystem = { pkgs, config, ... }: {
    packages.${name} = (pkgs.writers.writeNuBin name ./app.nu).overrideAttrs (old: {
      meta = old.meta // {
        description = "niri 画中画 (Picture In Picture) 窗口自动跟随 workspace";
      };
    });
    overlayAttrs.${name} = config.packages.${name};
  };
}
