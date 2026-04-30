-- 注册文件类型
if not vim.filetype.match({ filename = "cangjie" }) then
  vim.filetype.add({
    extension = {
      cj = "cangjie",
    },
  })
end

return {
  {
    "https://gitcode.com/ystyle/cangjie-nvim",
    ft = "cangjie",
    dependencies = {
      "neovim/nvim-lspconfig",
    },
    config = function()
      require("cangjie-nvim").setup({
        cangjie_home = "/home/linca/cangjie"
      })
    end
  }
}
