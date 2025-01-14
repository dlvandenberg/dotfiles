return {
  "williamboman/mason-lspconfig.nvim",
  dependencies = {
    "williamboman/mason.nvim",
    "neovim/nvim-lspconfig",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")
    local mason_tool_installer = require("mason-tool-installer")

    mason_lspconfig.setup({
      ensure_installed = {
        "ts_ls",
        "html",
        "cssls",
        "svelte",
        "lua_ls",
        "graphql",
        "emmet_ls",
      },
      -- auto install configured servers
      automatic_installation = true,

      -- handlers = {
      --   lsp_zero.default_setup,
      --   lua_ls = function()
      --     local lua_opts = lsp_zero.nvim_lua_ls()
      --     lspconfig.lua_ls.setup(lua_opts)
      --   end,
      -- },
    })

    mason_tool_installer.setup({
      ensure_installed = {
        "prettier",
        "stylua",
        "eslint_d",
      },
    })
  end,
}
