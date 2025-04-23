-- :h lsp-config
--
local function configure_diagnostics()
  -- Enable diagnostics
  vim.diagnostic.config({
    underline = true,
    update_in_insert = true,
    severity_sort = true,
    virtual_text = {
      severity = {
        max = vim.diagnostic.severity.WARN,
      },
    },
    virtual_lines = {
      severity = {
        min = vim.diagnostic.severity.ERROR,
      },
    },
    float = {
      border = "rounded",
      source = "if_many",
    },
    signs = {
      text = {
        [vim.diagnostic.severity.ERROR] = "",
        [vim.diagnostic.severity.WARN] = "",
        [vim.diagnostic.severity.INFO] = "",
        [vim.diagnostic.severity.HINT] = "",
      },
    },
  })
end

-- Enable LSP auto-completion
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("dennis.lsp", {}),
  callback = function(args)
    local map = function(keys, func, desc, mode)
      mode = mode or "n"
      vim.keymap.set(mode, keys, func, {
        buffer = args.buf,
        desc = "LSP: " .. desc,
      })
    end

    -- map("<leader>[d", "<cmd>lua vim.diagnostic.goto_next()<cr>", desc = "Go to next diagnostic" ),
    -- map("<leader>]d", "<cmd>lua vim.diagnostic.goto_previous()<cr>", desc = "Go to previous diagnostic" },
    map("<leader>cr", "<cmd>lua vim.lsp.buf.rename()<cr>", "[C]ode [R]ename")
    map("<leader>gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", "[G]o to [D]eclaration")
    map("<leader>gd", "<cmd>lua vim.lsp.buf.definition()<cr>", "[G]o to [D]efinition")
    -- map("<leader>gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", desc = "[G]o to [I]mplentation" },
    map("<leader>h", "<cmd>lua vim.lsp.buf.hover()<cr>", "[H]over")
    map("<leader>vca", "<cmd>lua vim.lsp.buf.code_action()<cr>", "[V]iew [C]ode [A]ctions")
    map("<leader>vd", "<cmd>lua vim.diagnostic.open_float()<cr>", "[V]iew [D]iagnostics")
    -- map("<leader>vr", "<cmd>lua vim.lsp.buf.references()<cr>", desc = "[V]iew [R]eferences" },
    -- map("<leader>vws", "<cmd>lua vim.lsp.buf.workspace_symbol()<cr>", desc = "[V]iew [W]orkspace [S]ymbols" },
    local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
    if not client then
      return
    end

    if client:supports_method("textDocument/implementation") then
      -- Create a keymap for vim.lsp.buf.implementation
    end

    -- Enable auto-completion. Note: Use CTRL+Y to select an item
    -- if client:supports_method(vim.lsp.protocol.Methods.textDocument_completion) then
    --   vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
    -- end
    --

    -- Support inlay hints
    if client:supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
      map("<leader>th", function()
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = args.buf }))
      end, "[T]oggle Inlay [H]ints")
    end

    configure_diagnostics()
  end,
})

-- Enable configured language servers
-- Configuration is placed in lsp/*.lua files
vim.lsp.enable({ "lua_ls", "html", "cssls", "emmet_ls", "ts_ls", "angularls", "jsonls", "eslint" })
