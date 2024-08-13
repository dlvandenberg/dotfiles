return {
  "LudoPinelli/comment-box.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local wk = require("which-key")
    local cb = require("comment-box")

    wk.add({
      { "<leader>c", group = " Boxes" },
      { "<leader>cb", "<Cmd>CBlcbox<CR>", desc = "Box Title" },
      { "<leader>cd", "<Cmd>Cbd<CR>", desc = "Delete box" },
      { "<leader>cl", "<Cmd>CBline<CR>", desc = "Simple Line" },
      { "<leader>cm", "<Cmd>CBllbox14<CR>", desc = "Marked" },
      { "<leader>ct", "<Cmd>CBllline<CR>", desc = "Titled Line" },
    })

    cb.setup()
  end,
}
