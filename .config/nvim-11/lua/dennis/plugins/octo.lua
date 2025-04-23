return {
  "pwntester/octo.nvim",
  dependencies = {
    "nvim-treesitter",
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  keys = {
    { "<leader>o", "<CMD>Octo<CR>", desc = "[O]cto" },
  },
  init = function()
    vim.treesitter.language.register("markdown", "octo")
  end,
  config = function()
    local octo = require("octo")

    octo.setup({
      enable_builtin = true,
      colors = {
        white = "#f6f6f4",
        grey = "#908d75",
        black = "#201c21",
        red = "#da6058",
        dark_red = "#c6462c",
        green = "#96bf73",
        dark_green = "7cae50",
        yellow = "#f5eba3",
        dark_yellow = "#d1bc18",
        blue = "#8b8c1",
        dark_blue = "#467e86",
        purple = "#8c697e",
      },
    })

    local wk = require("which-key")
    wk.add({
      { "<leader>o", "<CMD>Octo<CR>", desc = "[O]cto" },
    })
  end,
}
