{ ... }:
let name = "niri-follow-pip"; in
{
  perSystem = { pkgs, config, ... }: {
    packages.${name} = pkgs.writers.writeNuBin name ./app.nu;
    overlayAttrs.${name} = config.packages.${name};
  };
}
