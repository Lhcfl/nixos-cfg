{
  lib,
  config,
  pkgs,
  ...
}:
# 暂时关掉这个模块。当前 llm-agents 的 chatgpt 构建出错。
{
  config = lib.mkIf (false && config.funkcia.hm.gui.enable) {
    home.packages = with pkgs; [
      llm-agents.chatgpt
    ];
  };
}
