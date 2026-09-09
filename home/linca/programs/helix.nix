{ pkgs, ... }:
{
  programs.helix = {
    enable = true;
    extraPackages = with pkgs; [
      lua-language-server
      typescript-language-server
      typescript
      markdownlint-cli2
      markdown-oxide
    ];
  };
}
