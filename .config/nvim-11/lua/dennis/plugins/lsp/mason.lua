return {
  "mason-org/mason.nvim",
  lazy = false,
  config = function()
    local mason = require("mason")

    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "→",
          package_uninstalled = "✕",
        },
        border = "rounded",
      },
    })
  end,
}
