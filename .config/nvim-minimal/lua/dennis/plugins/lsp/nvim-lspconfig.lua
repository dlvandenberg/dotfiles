return {
  "neovim/nvim-lspconfig",
  cmd = { 'LspInfo', 'LspInstall', 'LspStart' },
  event = { 'BufReadPre', 'BufNewFile' },
  dependencies = {
    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },
    -- Autocompletion
    { "hrsh7th/cmp-nvim-lsp" },
    -- { "hrsh7th/cmp-buffer" },
  },
  init = function()
    vim.opt.signcolumn = 'yes'
  end,
  config = function()

    local lspconfig_defaults = require('lspconfig').util.default_config
    lspconfig_defaults.capabilities = vim.tbl_deep_extend(
      'force',
      lspconfig_defaults.capabilities,
      require('cmp_nvim_lsp').default_capabilities()
    )

    local on_attach = function(_, _)
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

    vim.api.nvim_create_autocmd('LspAttach', {
      desc = "LSP Actions",
      callback = on_attach
    })

    -- ╭─────────────────────────────────────────────────────────╮
    -- │ Setup diagnostic                                        │
    -- ╰─────────────────────────────────────────────────────────╯
    vim.diagnostic.config({ source = true })

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
      on_attach = on_attach,
    })

    -- local omnisharp_bin = "~/.local/share/nvim/mason/bin/omnisharp"
    -- local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
    -- config.omnisharp.setup({
    --   -- cmd = { omnisharp_bin, "--languageserver", "--hostPID", tostring(pid) },
    --   on_attach = on_attach,
    --   capabilities = capabilities,
    -- })
    --
    config.angularls.setup({
      root_dir = util.root_pattern("angular.json", "project.json"),
      filetypes = { "html", "typescript", "typescriptreact", "htmlangular" },
    })

    config.ts_ls.setup({
      root_dir = util.root_pattern(".git"),
    })

    -- Assumes lua-language-server is installed ─────────────────
    config.lua_ls.setup({})
  end,
}
