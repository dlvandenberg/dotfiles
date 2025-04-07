vim.filetype.add({
  pattern = {
    [".*%.ftl"] = "freemarker",
  },
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "freemarker",
  callback = function()
    vim.treesitter.language.register("freemarker", "freemarker")
  end,
})
