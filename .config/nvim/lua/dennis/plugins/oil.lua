return {
  "stevearc/oil.nvim",
  opts = {},
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("oil").setup({
      default_file_explorer = false,
      column = {
        "icon",
        "permission",
      },
      keymaps = {
        ["g?"] = "actions.show_help",
        ["<CR>"] = "actions.select",
        ["<C-v>"] = { "actions.select", opts = { vertical = true }, desc = "Open in vertical split" },
        ["<C-s>"] = { "actions.select", opts = { horizontal = true }, desc = "Open in horizontal split" },
        ["<C-t>"] = { "actions.select", opts = { tab = true }, desc = "Open in tab" },
        ["<C-r>"] = "actions.refresh",
        ["<C-c>"] = "actions.close",
        ["-"] = "actions.parent",
        ["_"] = "actions.open_cwd",
        ["`"] = "actions.cd",
        ["gs"] = "actions.change_sort",
        ["g."] = "actions.toggle_hidden",
      },
      use_default_keymaps = false,
    })

    local wk = require("which-key")

    wk.add({
      { "-", "<CMD>Oil<CR>", desc = "Open Oil" },
      { "<leader>-", require("oil").toggle_float, desc = "Toggle Oil in Float" },
    })
  end,
}
