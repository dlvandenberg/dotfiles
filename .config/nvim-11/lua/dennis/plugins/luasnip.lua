return {
  "L3MON4D3/LuaSnip",
  -- follow latest release.
  version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
  -- install jsregexp (optional!).
  build = "make install_jsregexp",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local wk = require("which-key")
    local ls = require("luasnip")

    wk.add({
      {
        "<C-n",
        function()
          if ls.expand_or_jumpable then
            ls.expand_or_jump()
          end
        end,
        { silent = true },
      },
      {
        "<C-p",
        function()
          if ls.jumpable(-1) then
            ls.jump(-1)
          end
        end,
        { silent = true },
      },
      { mode = {
        "i",
        "s",
      } },
    })

    require("luasnip.loaders.from_lua").load({ paths = vim.fs.joinpath(vim.fn.stdpath("config"), "snippets") })
    require("luasnip.loaders.from_vscode").lazy_load()
  end,
}
