return {
  name = "nvim-treesitter",
  "nvim-treesitter/nvim-treesitter",
  -- "dlvandenberg/nvim-treesitter",
  -- branch = "feat-angular-template-literals",
  build = ":TSUpdate",
  event = { "BufRead", "BufNewFile" },
  dependencies = {
    { "nvim-treesitter/nvim-treesitter-textobjects" },
    -- { "nvim-treesitter/playground" },
  },
  config = function()
    local configs = require("nvim-treesitter.configs")
    local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
    parser_config.freemarker = {
      install_info = {
        url = "~/Developer/git/tree-sitter-freemarker/", -- local path or git repo
        files = { "src/parser.c" }, -- note that some parsers also require src/scanner.c or src/scanner.cc
        -- optional entries:
        generate_requires_npm = false, -- if stand-alone parser without npm dependencies
        branch = "main", -- default branch in case of git repo if different from master
        requires_generate_from_grammar = false, -- if folder contains pre-generated src/parser.c
      },
    }

    configs.setup({
      ensure_installed = {
        "angular",
        "css",
        "tsx",
        "javascript",
        "typescript",
        -- "c",
        "lua",
        "vim",
        "vimdoc",
        -- "query",
        "html",
        "svelte",
        "graphql",
        "bash",
        -- "gitignore",
        "dockerfile",
        "markdown",
        "markdown_inline",
        -- "nginx",
      },

      -- Install parsers synchronously (only applied to `ensure_installed`)
      sync_install = false,

      -- Automatically install missing parsers when entering buffer
      -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
      auto_install = true,

      highlight = {
        enable = true,

        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false,
      },

      indent = { enable = true },

      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<leader>w",
          node_incremental = "<leader>w",
          scope_incremental = false,
          node_decremental = "<leader>W",
        },
      },

      -- playground = {
      --   enable = true,
      --   disable = {},
      --   updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
      --   persist_queries = false, -- Whether the query persists across vim sessions
      --   keybindings = {
      --     toggle_query_editor = "o",
      --     toggle_hl_groups = "i",
      --     toggle_injected_languages = "t",
      --     toggle_anonymous_nodes = "a",
      --     toggle_language_display = "I",
      --     focus_language = "f",
      --     unfocus_language = "F",
      --     update = "R",
      --     goto_node = "<cr>",
      --     show_help = "?",
      --   },
      -- },

      --- Add freemarker
    })
  end,
}
