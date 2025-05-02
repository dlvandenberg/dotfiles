-- Load :Cfilter
vim.cmd([[ packadd cfilter ]])

vim.api.nvim_create_user_command("QFList", function()
  local qflist = vim.fn.getqflist()

  local files = {}
  for _, entry in ipairs(qflist) do
    local name = vim.fn.bufname(entry.bufnr)
    if name ~= "" then
      files[name] = true
    end
  end

  local new_qf = {}
  for filename, _ in pairs(files) do
    table.insert(new_qf, { filename = filename, lnum = 1, text = filename })
  end

  vim.fn.setqflist({}, "r", { items = new_qf })
  vim.cmd("copen")

  -- Print Length
  print("Quickfix contains " .. #new_qf .. " files")
end, {})
