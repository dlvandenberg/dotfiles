return {
  "VonHeikemen/lsp-zero.nvim",
  branch = "v3.x",
  dependencies = {
    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },

    -- LSP Support
    { "neovim/nvim-lspconfig" },
    -- Autocompletion
    { "hrsh7th/nvim-cmp" },
    { "hrsh7th/cmp-nvim-lsp" },
    { "hrsh7th/cmp-buffer" },
    { "L3MON4D3/LuaSnip" },
  },
  config = function()
    -- Setup lsp-zero
    local lsp_zero = require("lsp-zero")

    local on_attach = function(client, bufnr)
      local wk = require("which-key")

      wk.add({
        { "<leader>[d", "<cmd>lua vim.diagnostic.goto_next()<cr>", desc = "Go to next diagnostic" },
        { "<leader>]d", "<cmd>lua vim.diagnostic.goto_previous()<cr>", desc = "Go to previous diagnostic" },
        { "<leader>cr", "<cmd>lua vim.lsp.buf.rename()<cr>", desc = "[C]ode [R]ename" },
        { "<leader>gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", desc = "[G]o to [D]eclaration" },
        { "<leader>gd", "<cmd>lua vim.lsp.buf.definition()<cr>", desc = "[G]o to [D]efinition" },
        { "<leader>gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", desc = "[G]o to [I]mplentation" },
        { "<leader>h", "<cmd>lua vim.lsp.buf.hover()<cr>", desc = "[H]over" },
        { "<leader>vca", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "[V]iew [C]ode [A]ctions" },
        { "<leader>vd", "<cmd>lua vim.diagnostic.open_float()<cr>", desc = "[V]iew [D]iagnostics" },
        { "<leader>vr", "<cmd>lua vim.lsp.buf.references()<cr>", desc = "[V]iew [R]eferences" },
        { "<leader>vws", "<cmd>lua vim.lsp.buf.workspace_symbol()<cr>", desc = "[V]iew [W]orkspace [S]ymbols" },
      })

      wk.add({
        { "<C-a>", "<cmd>lua vim.lsp.buf.signature_help()<cr>", desc = "Signature Help", mode = "i" },
        { "<M-s>", "<cmd>lua vim.lsp.buf.signature_help()<cr>", desc = "Signature Help", mode = "i" },
      })
    end
    lsp_zero.on_attach(on_attach)

    -- ╭─────────────────────────────────────────────────────────╮
    -- │ Setup diagnostic                                        │
    -- ╰─────────────────────────────────────────────────────────╯
    vim.diagnostic.config({ source = true })

    -- Setup Mason
    -- require('mason').setup({})
    -- require('mason-lspconfig').setup({
    --     ensure_installed = {'tsserver', 'eslint'},
    -- })

    local config = require("lspconfig")
    local util = require("lspconfig.util")

    -- ╭─────────────────────────────────────────────────────────╮
    -- │ LSP setup                                               │
    -- ╰─────────────────────────────────────────────────────────╯
    config.sourcekit.setup({
      capabilities = {
        workspace = {
          didChangeWatchedFiles = {
            dynamicRegistration = true,
          },
        },
      },
    })

    local omnisharp_bin = "~/.local/share/nvim/mason/bin/omnisharp"
    local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
    config.omnisharp.setup({
      -- cmd = { omnisharp_bin, "--languageserver", "--hostPID", tostring(pid) },
      on_attach = on_attach,
      capabilities = capabilities,
    })

    config.angularls.setup({
      root_dir = util.root_pattern("angular.json", "project.json"),
      filetypes = { "html", "typescript", "typescriptreact", "htmlangular" },
    })

    config.ts_ls.setup({})

    -- Assumes lua-language-server is installed ─────────────────
    config.lua_ls.setup({})
  end,
}
