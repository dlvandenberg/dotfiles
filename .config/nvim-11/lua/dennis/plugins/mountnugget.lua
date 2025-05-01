return {
  dir = "~/Developer/git/mountnugget.nvim/",
  priority = 1000,
  config = function()
    require("mountnugget").setup({
      transparent = true,
      dim_inactive = true,
    })

    -- setup must be called before loading
    -- vim.cmd.colorscheme("mountnugget")
  end,
}
