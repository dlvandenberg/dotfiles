return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("tokyonight").setup({
      on_highlights = function(highlights, colors)
        highlights.LineNr = {
          fg = colors.blue5,
        }
        highlights.LineNrAbove = {
          fg = colors.todo,
        }
        highlights.LineNrBelow = {
          fg = colors.todo,
        }
      end,
    })

    -- vim.cmd.colorscheme("tokyonight-storm")
  end,
}
