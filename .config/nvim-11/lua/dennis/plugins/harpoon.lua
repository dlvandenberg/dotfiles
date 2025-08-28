return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    local harpoon = require("harpoon")
    harpoon:setup()

    local wk = require("which-key")

    wk.add({
      {
        "<leader>a",
        function()
          harpoon:list():add()
        end,
        { desc = "[A]dd file to Harpoon" },
      },
      {
        "<C-e>",
        function()
          harpoon.ui:toggle_quick_menu(harpoon:list())
        end,
        { desc = "Toggle Harpoon Menu" },
      },
      {
        "<C-1>",
        function()
          harpoon:list():select(1)
        end,
        { desc = "[1] Harpoon" },
      },
      {
        "<C-2>",
        function()
          harpoon:list():select(2)
        end,
        { desc = "[2] Harpoon" },
      },
      {
        "<C-3>",
        function()
          harpoon:list():select(3)
        end,
        { desc = "[3] Harpoon" },
      },
      {
        "<C-4>",
        function()
          harpoon:list():select(4)
        end,
        { desc = "[4] Harpoon" },
      },
      {
        "<leader><leader>n",
        function()
          harpoon:list():next()
        end,
        { desc = "[N]ext item in Harpoon" },
      },
      {
        "<leader><leader>p",
        function()
          harpoon:list():prev()
        end,
        { desc = "[P]revious item in Harpoon" },
      },
    })
  end,
}
