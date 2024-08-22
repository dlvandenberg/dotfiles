return {
  dir = "~/Developer/git/mountnugget.nvim/",
  priority = 1000,
  config = function()
    require("mountnugget").setup()

    -- setup must be called before loading
    vim.cmd.colorscheme("mountnugget")
  end,
}
