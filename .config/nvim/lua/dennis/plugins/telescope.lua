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

    -- Custom keymaps
    keymap.set("n", "<leader>pf", function()
      builtin.find_files({ hidden = true })
    end, { desc = "[P]roject [F]iles" })
    keymap.set("n", "<leader>pb", builtin.buffers, { desc = "[P]roject [B]uffers" })
    keymap.set("n", "<leader>ps", function()
      builtin.grep_string({ search = vim.fn.input("Grep > ") })
    end, { desc = "[P]roject [S]earch" })
    keymap.set("n", "<C-p>", function()
      builtin.git_files({ show_untracked = true })
    end)
    keymap.set("n", "<leader>vh", builtin.help_tags, { desc = "[V]im [H]elp" })
    -- keymap.set("n", "<C-o>", function()
    --   builtin.oldfiles({ cwd_only = true })
    -- end)
    keymap.set("n", "<leader>H", "<CMD>Telescope helpgrep<CR>", { desc = "[H]elp [S]earch" })
    -- keymap.set("n", "<leader>u", "<CMD>Telescope undo<CR>", { desc = "[U]ndo" })
  end,
}
