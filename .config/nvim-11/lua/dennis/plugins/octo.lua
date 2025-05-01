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
        white = "#c6c6c6",
        grey = "#949494",
        black = "#323437",
        red = "#ff5189",
        dark_red = "#ff5d5d",
        green = "#35c692",
        dark_green = "#8cc85f",
        yellow = "#c6c684",
        dark_yellow = "#e3c78a",
        blue = "#74b2ff",
        dark_blue = "#80a0ff",
        purple = "#cf87e8",
      },
      -- colors = {
      --   white = "#f6f6f4",
      --   grey = "#908d75",
      --   black = "#201c21",
      --   red = "#da6058",
      --   dark_red = "#c6462c",
      --   green = "#96bf73",
      --   dark_green = "7cae50",
      --   yellow = "#f5eba3",
      --   dark_yellow = "#d1bc18",
      --   blue = "#8bb8c1",
      --   dark_blue = "#467e86",
      --   purple = "#8c697e",
      -- },
    })

    local wk = require("which-key")
    wk.add({
      { "<leader>o", "<CMD>Octo<CR>", desc = "[O]cto" },
    })
  end,
}
