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

    lsp_zero.on_attach(function(client, bufnr)
      local wk = require("which-key")

      wk.register({
        h = { "<cmd>lua vim.lsp.buf.hover()<cr>", "[H]over" },
        gd = { "<cmd>lua vim.lsp.buf.definition()<cr>", "[G]o to [D]efinition" },
        gD = { "<cmd>lua vim.lsp.buf.declaration()<cr>", "[G]o to [D]eclaration" },
        gi = { "<cmd>lua vim.lsp.buf.implementation()<cr>", "[G]o to [I]mplentation" },
        vws = { "<cmd>lua vim.lsp.buf.workspace_symbol()<cr>", "[V]iew [W]orkspace [S]ymbols" },
        vca = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "[V]iew [C]ode [A]ctions" },
        vr = { "<cmd>lua vim.lsp.buf.references()<cr>", "[V]iew [R]eferences" },
        cr = { "<cmd>lua vim.lsp.buf.rename()<cr>", "[C]ode [R]ename" },
        vd = { "<cmd>lua vim.diagnostic.open_float()<cr>", "[V]iew [D]iagnostics" },
        ["[d"] = { "<cmd>lua vim.diagnostic.goto_next()<cr>", "Go to next diagnostic" },
        ["]d"] = { "<cmd>lua vim.diagnostic.goto_previous()<cr>", "Go to previous diagnostic" },
      }, {
        prefix = "<leader>",
        mode = "n",
        silent = true,
      })

      wk.register({
        ["<C-a>"] = { "<cmd>lua vim.lsp.buf.signature_help()<cr>", "Signature Help" },
        ["<M-s>"] = { "<cmd>lua vim.lsp.buf.signature_help()<cr>", "Signature Help" },
      }, {
        mode = "i",
        silent = true,
      })
    end)

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

    config.angularls.setup({
      root_dir = util.root_pattern("angular.json", "project.json"),
      filetypes = { "html", "typescript", "typescriptreact", "angular.html" },
    })

    -- Assumes lua-language-server is installed ─────────────────
    config.lua_ls.setup({})
  end,
}
