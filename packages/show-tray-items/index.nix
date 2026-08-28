{ ... }:
let name = "show-tray-items"; in
{
  perSystem = { pkgs, config, ... }: {
    packages.${name} = (pkgs.writers.writeNuBin name ./app.nu).overrideAttrs (_: {
      meta.description = "给出任务栏图标";
    });
    overlayAttrs.${name} = config.packages.${name};
  };
}
