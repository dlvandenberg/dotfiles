return {
  dir = "~/Developer/git/mountnugget.nvim/",
  priority = 1000,
  config = function()
    require("mountnugget").setup({
      integrations = {
        nvimtree = true,
        telescope = true,
        which_key = true,
        cmp = true,
        dap = true,
        gitsigns = true,
        markdown = true,
        mason = true,
        neotest = true,
        treesitter = true,
        lazygit = true,
      },
    })

    -- setup must be called before loading
    vim.cmd.colorscheme("mountnugget")
  end,
}
