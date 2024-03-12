vim.filetype.add({
  pattern = {
    [".*%.component%.html"] = "angular.html",
  },
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "angular.html",
  callback = function()
    vim.treesitter.language.register("angular", "angular.html")
  end,
})
