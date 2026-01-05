{
  lib,
  ...
}:
{
  options.funkcia.hm.gui = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Enable GUI packages";
    };
  };

  imports = [
    ./gui/modules/kde.nix
    ./gui/modules/hypr.nix
    ./gui/modules/vicinae.nix
    ./gui/vscode/vscode.nix # 还没写完
    ./gui/packages.nix
  ];
}
