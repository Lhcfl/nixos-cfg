{ pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    extraPackages = with pkgs; [
      lua-language-server
      lua5_1
      luarocks
      typescript-language-server
      typescript
      # markdownlint-cli2
    ];
    sideloadInitLua = true;
  };
}
