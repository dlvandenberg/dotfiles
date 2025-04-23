return {
  "folke/zen-mode.nvim",
  config = function()
    require("zen-mode").setup({
      window = {
        options = {
          relativenumber = true,
        },
      },
      plugins = {
        wezterm = {
          enabled = true,
        },
      },
    })
    local wk = require("which-key")
    wk.add({ "<leader>zm", "<CMD>ZenMode<CR>", desc = "[Z]en [M]ode" })
  end,
}
