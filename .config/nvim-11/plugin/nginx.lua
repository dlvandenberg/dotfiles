vim.filetype.add({
  pattern = {
    [".*%.conf"] = "nginx",
  },
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "nginx",
  callback = function()
    vim.treesitter.language.register("nginx", "nginx")
  end,
})
