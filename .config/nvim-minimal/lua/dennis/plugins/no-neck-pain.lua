return {
  "shortcuts/no-neck-pain.nvim",
  version = "*",
  config = function()
    require("no-neck-pain").setup({
      width = 130,
    })
    local wk = require("which-key")
    wk.add({ "<leader>nn", "<CMD>NoNeckPain<CR>", desc = "[N]o [N]eck pain" })
  end,
  event = { "BufReadPre", "BufNewFile" },
}
