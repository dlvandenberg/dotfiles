---@type vim.lsp.Config
return {
  -- Command to start the LSP
  cmd = { "lua-language-server" },
  -- Filetypes to automatically attach to.
  filetypes = { "lua" },
  -- Sets the "root directory" to the parent directory of the file in th
  -- current buffer that contains the given files. Files that share a
  -- root directory will reuse the connection to the same LSP server.
  root_markers = { ".luarc.json", ".luarc.jsonc", ".stylua.toml", "stylua.toml", ".git" },
  -- Specific settings to send to the server. The schema for this is
  -- defined by the server.
}
