{
  pkgs,
  lib,
  vscode-exts,
  ...
}:
{
  userSettings = lib.importJSON ./cangjie.settings.json;
  extensions = with vscode-exts.vscode-marketplace; [
    ms-azuretools.vscode-containers
    ms-vscode-remote.remote-containers
  ];
}
