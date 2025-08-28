local ts_utils = require("nvim-treesitter.ts_utils")
local M = {}

local copy_path = function()
  local result = {}
  local node = ts_utils.get_node_at_cursor()

  while node do
    if tostring(node) == "<node pair>" then
      local key_node = node:named_child(0):named_child(0)
      table.insert(result, 1, ts_utils.get_node_text(key_node)[1])
    end

    node = node:parent()
  end

  local path = vim.fn.join(result, ".")
  vim.fn.setreg('"', path, "v")
  vim.fn.setreg("+", path, "v")
  vim.notify("Yanked JSON  path: " .. path)
end

M.copy_path = copy_path

return M
