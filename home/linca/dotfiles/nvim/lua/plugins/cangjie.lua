return {
  {
    "https://gitcode.com/ystyle/cangjie-nvim",
    ft = "cj",
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
