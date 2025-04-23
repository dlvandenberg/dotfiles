---@type vim.lsp.Config
return {
  cmd = { "graphql-lsp", "server", "-m", "stream" },
  filetypes = {
    "graphql",
    "typescript",
    "typescriptreact",
    "javascriptreact",
  },
  single_file_support = true,
}
