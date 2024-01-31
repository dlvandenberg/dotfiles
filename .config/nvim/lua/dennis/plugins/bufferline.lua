return {
  "akinsho/bufferline.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  version = "*",
  config = function()
    local bufferline = require("bufferline")
    bufferline.setup()

    local keymap = vim.keymap
    -- ── Buffer navigation ──────────────────────────────────────────────────────────────────────
    keymap.set("n", "<leader>bn", "<Cmd>BufferLineCycleNext<CR>", { desc = "[B]uffer [N]ext" })
    keymap.set("n", "<leader>bp", "<Cmd>BufferLineCyclePrev<CR>", { desc = "[B]uffer [P]revious" })
    keymap.set("n", "<leader>bb", "<Cmd>BufferLinePick<CR>", { desc = "[B]uffer Pick [B]uffer" })

    keymap.set("n", "<leader>b1", "<Cmd>BufferLineGoToBuffer 1<CR>", { desc = "[B]uffer [1]" })
    keymap.set("n", "<leader>b2", "<Cmd>BufferLineGoToBuffer 2<CR>", { desc = "[B]uffer [2]" })
    keymap.set("n", "<leader>b3", "<Cmd>BufferLineGoToBuffer 3<CR>", { desc = "[B]uffer [3]" })
    keymap.set("n", "<leader>b4", "<Cmd>BufferLineGoToBuffer 4<CR>", { desc = "[B]uffer [4]" })
    keymap.set("n", "<leader>b5", "<Cmd>BufferLineGoToBuffer 5<CR>", { desc = "[B]uffer [5]" })
    keymap.set("n", "<leader>b6", "<Cmd>BufferLineGoToBuffer 6<CR>", { desc = "[B]uffer [6]" })
    keymap.set("n", "<leader>b7", "<Cmd>BufferLineGoToBuffer 7<CR>", { desc = "[B]uffer [7]" })
    keymap.set("n", "<leader>b8", "<Cmd>BufferLineGoToBuffer 8<CR>", { desc = "[B]uffer [8]" })
    keymap.set("n", "<leader>b9", "<Cmd>BufferLineGoToBuffer 9<CR>", { desc = "[B]uffer [9]" })
    keymap.set("n", "<leader>b$", "<Cmd>BufferLineGoToBuffer -1<CR>", { desc = "[B]uffer [$] last visible" })

    -- ── Closing buffers  ──────────────────────────────────────────────────────────────────
    keymap.set("n", "<leader>bco", "<Cmd>BufferLineCloseOthers<CR>", { desc = "[B]uffer [C]lose [O]thers" })
    keymap.set("n", "<leader>bcl", "<Cmd>BufferLineCloseLeft<CR>", { desc = "[B]uffer [C]lose [L]eft of this buffer" })
    keymap.set(
      "n",
      "<leader>bcr",
      "<Cmd>BufferLineCloseRight<CR>",
      { desc = "[B]uffer [C]lose [R]ight of this buffer" }
    )
    keymap.set("n", "<leader>bcb", "<Cmd>BufferLinePickClose<CR>", { desc = "[B]uffer [C]lose pick [B]uffer" })
  end,
}
