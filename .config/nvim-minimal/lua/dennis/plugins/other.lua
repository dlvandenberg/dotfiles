return {
  "rgroli/other.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local other = require("other-nvim")

    other.setup({
      mappings = {
        "angular",
      },
    })

    local wk = require("which-key")

    wk.add({
      { "<leader>oo", "<CMD>Other<CR>", desc = "[O]pen [O]ther file" },
      { "<leader>oh", "<CMD>OtherSplit<CR>", desc = "[O]pen Other file [H]orizontal Split" },
      { "<leader>ov", "<CMD>OtherVSplit<CR>", desc = "[O]pen Other file [V]ertical Split" },
    })
  end,
}
