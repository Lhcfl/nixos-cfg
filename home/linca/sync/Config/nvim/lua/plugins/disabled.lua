local handle = io.popen("uname -a")
local sysinfo = handle:read("*a")
handle:close()

local is_nixos = string.find(sysinfo, "NixOS", 1) ~= nil

return {
  { "mason-org/mason-lspconfig.nvim", enabled = ! is_nixos },
  { "mason-org/mason.nvim",           enabled = ! is_nixos },
  { "mpeterv/hererocks.nvim",         enabled = ! is_nixos }
}

