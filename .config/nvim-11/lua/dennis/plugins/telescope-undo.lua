return {
  "debugloop/telescope-undo.nvim",
  dependencies = {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
  keys = {
    {
      "<leader>u",
      "<cmd>Telescope undo<cr>",
      desc = "Undo history",
    },
  },
  opts = {
    extensions = {
      undo = {},
    },
  },
  config = function(opts)
    require("telescope").setup(opts)
    require("telescope").load_extension("undo")
  end,
}
