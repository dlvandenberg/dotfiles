return {
  "ellisonleao/gruvbox.nvim",
  priority = 1000,
  config = function()
    local gruvbox = require("gruvbox")
    gruvbox.setup({
      overrides = {
        ["@lsp.type.typeParameter.typescript"] = { bold = true },
        ["@keyword.conditional.angular"] = { link = "GruvboxYellowBold" },
        ["@keyword.repeat.angular"] = { link = "GruvboxYellowBold" },
        ["@keyword.coroutine.angular"] = { link = "GruvboxYellowBold" },
        ["@keyword.exception.angular"] = { link = "GruvboxYellowBold" },
        ["@attribute.angular"] = { link = "GruvboxAqua" },
      },
    })

    vim.o.background = "dark" -- or "light" for light mode
    vim.cmd([[colorscheme gruvbox]])
  end,
}
