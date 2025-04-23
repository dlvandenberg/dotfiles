---@type vim.lsp.Config
return {
  -- Command to start the LSP
  cmd = { "vscode-json-language-server", "--stdio" },
  -- Filetypes to automatically attach to.
  filetypes = { "json", "jsonc" },
}
