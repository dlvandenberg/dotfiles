return {
  "LudoPinelli/comment-box.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local wk = require("which-key")
    local cb = require("comment-box")

    wk.register({
      ["<leader>c"] = {
        name = " Boxes",
        b = { "<Cmd>CBccbox<CR>", "Box Title" },
        t = { "<Cmd>CBllline<CR>", "Titled Line" },
        l = { "<Cmd>CBline<CR>", "Simple Line" },
        m = { "<Cmd>CBllbox14<CR>", "Marked" },
        d = { "<Cmd>Cbd<CR>", "Delete box" },
      },
    })

    cb.setup()
  end,
}
