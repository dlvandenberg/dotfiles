return {
  'hrsh7th/nvim-cmp',
  event = 'InsertEnter',
  config = function()
    local cmp = require("cmp")
    local cmp_select = { behavior = cmp.SelectBehavior.Select }

    cmp.setup({
      completion = {
        completeopt = "menu,menuone,preview,noselect,noinsert",
      },
      snippet = { -- configure how nvim-cmp interacts with snippet engine
        expand = function(args)
          vim.snippet.expand(args.body)
        end,
      },
      -- custom mappings
      mapping = cmp.mapping.preset.insert({
        ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select), -- previous suggestion
        ["<C-n>"] = cmp.mapping.select_next_item(cmp_select), -- next suggestion
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
        ["<C-e>"] = cmp.mapping.abort(), -- close completion window
        ["<CR>"] = cmp.mapping.confirm({ select = false }), -- confirm selection
      }),
      -- sources for autocompletion
      sources = cmp.config.sources({ -- order of the sources will determine priorities
        { name = "nvim_lsp" }, -- lsp suggestions
        { name = "path" }, -- file system paths
        { name = "buffer" }, -- text within current buffer
      }),
    })
  end,
}
