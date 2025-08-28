return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.4",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "mfussenegger/nvim-dap",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-telescope/telescope-dap.nvim",
    "catgoose/telescope-helpgrep.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local telescope = require("telescope")
    local builtin = require("telescope.builtin")
    local keymap = vim.keymap

    telescope.load_extension("fzf")
    telescope.load_extension("dap")
    telescope.load_extension("helpgrep")

    telescope.setup({
      extensions = {
        helpgrep = {
          ignore_paths = {
            vim.fn.stdpath("state") .. "/lazy/readme",
          },
        },
      },
    })

    local wk = require("which-key")

    wk.add({
      {
        "<leader>pf",
        function()
          builtin.find_files({ hidden = true })
        end,
        desc = "[P]roject [F]iles",
      },
      { "<leader>pb", builtin.buffers, desc = "[P]roject [B]uffers" },
      {
        "<leader>ps",
        function()
          builtin.grep_string({
            search = vim.fn.input("Grep > "),
            additional_args = function(opts)
              return { "--hidden" }
            end,
          })
        end,
        desc = "[P]roject [S]earch",
      },
      {
        "<C-p>",
        function()
          builtin.git_files({ show_untracked = true })
        end,
      },
      {
        "<leader>mg",
        function()
          require("dennis.plugins.telescope.multigrep").setup()
        end,
      },
      { "<leader>vh", builtin.help_tags, desc = "[V]im [H]elp" },
      { "<leader>H", "<CMD>Telescope helpgrep<CR>", desc = "[H]elp [S]earch" },
      { "<leader>u", "<CMD>Telescope undo<CR>", desc = "[U]ndo" },
    })
  end,
}
