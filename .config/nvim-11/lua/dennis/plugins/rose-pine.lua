return {
  "rose-pine/neovim",
  name = "rose-pine",
  priority = 1000,
  config = function()
    require("rose-pine").setup({
      dark_variant = "main",
      highlight_groups = {
        Visual = { bg = "iris", blend = 30 },
      },
    })
    vim.cmd("colorscheme rose-pine")
  end,
}
