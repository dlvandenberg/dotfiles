return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    -- Adapters
    -- "nvim-neotest/neotest-jest",
    {
      "dlvandenberg/neotest-jest",
      branch = "feat-call-expressions-in-testcase",
    },
    "nvim-neotest/neotest-plenary",
    "marilari88/neotest-vitest",
    "thenbe/neotest-playwright",
    -- Debugging
    "mfussenegger/nvim-dap",
  },
  config = function()
    local neotest = require("neotest")
    local jest = require("neotest-jest")
    local vitest = require("neotest-vitest")
    local playwright = require("neotest-playwright")

    -- ╭─────────────────────────────────────────────────────────╮
    -- │ Adapters                                                │
    -- ╰─────────────────────────────────────────────────────────╯
    neotest.setup({
      adapters = {
        require("neotest-plenary"),
        jest({
          jestCommand = "npx jest",
          jestConfigFile = function(file)
            if string.find(file, "/(apps|libs|features)/") then
              return string.match(file("(.-/[^/]+/)src")) .. "jest.config.ts"
            end
          end,
          cwd = function(path)
            return vim.fn.getcwd()
          end,
        }),
        vitest({
          filter_dir = function(name, rel_path, root)
            return name ~= "node_modules"
          end,
        }),
        playwright.adapter({
          options = {
            enable_dynamic_test_discovery = true,
            get_playwright_config = function()
              return vim.loop.cwd() + "/playwright.config.js"
            end,
          },
        }),
      },
    })

    -- ╭─────────────────────────────────────────────────────────╮
    -- │ Keymaps                                                 │
    -- ╰─────────────────────────────────────────────────────────╯
    local opts = { noremap = true, silent = true }
    local get_opts = require("utils").create_get_opts(opts)

    local keymap = vim.keymap

    keymap.set("n", "<leader>tt", neotest.run.run, get_opts({ desc = "[T]est File" }))
    keymap.set("n", "<leader>ta", function()
      neotest.run.run({ vim.fn.expand("%") })
    end, get_opts({ desc = "[T]est File" }))
    keymap.set("n", "<leader>to", neotest.output.open, get_opts({ desc = "[T]est [O]utput" }))
    keymap.set("n", "<leader>tp", neotest.output_panel.toggle, get_opts({ desc = "[T]est Output [P]anel" }))
    keymap.set("n", "<leader>ts", neotest.summary.toggle, get_opts({ desc = "[T]est [S]ummary" }))
    keymap.set("n", "<leader>tl", neotest.run.run_last, get_opts({ desc = "[T]est] [L]ast" }))
    -- keymap.set("n", "<leader>tw", neotest.watch.toggle, get_opts({ desc = "[T]est] [W]atch" }))
    keymap.set("n", "<leader>tw", function()
      neotest.run.run({ jestCommand = "npx jest --watch" })
    end, get_opts({ desc = "[T]est] [W]atch" }))
    keymap.set("n", "<leader>td", function()
      neotest.run.run({ vim.fn.expand("%"), strategy = "dap" })
    end, get_opts({ desc = "[T]est [D]ebug" }))
  end,
}
