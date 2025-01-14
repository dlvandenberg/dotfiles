return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    --- Adapters
    {
      "dlvandenberg/neotest-jest",
      branch = "feat-call-expressions-in-testcase",
    },
  },
  event = { "BufEnter *.spec.ts", "BufEnter *.test.ts" },
  config = function()
    local neotest = require("neotest")
    local jest = require("neotest-jest")

    -- Adapters
    neotest.setup({
      adapters = {
        -- require("plenary"),
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
      },
    })

    -- Keymaps
    local wk = require("which-key")

    wk.add({
      {
        "<leader>tt",
        neotest.run.run,
        desc = "[T]est File",
      },
      {
        "<leader>ta",
        function()
          neotest.run.run({ vim.fn.expand("%") })
        end,
        desc = "[T]est File",
      },
      {
        "<leader>to",
        neotest.output.open,
        desc = "[T]est [O]utput",
      },
      {
        "<leader>tp",
        neotest.output_panel.toggle,
        desc = "[T]est Output [P]anel",
      },
      {
        "<leader>ts",
        neotest.summary.toggle,
        desc = "[T]est [S]ummary",
      },
      {
        "<leader>tl",
        neotest.run.run_last,
        desc = "[T]est [L]ast",
      },
      {
        "<leader>tw",
        function()
          neotest.run.run({ jestCommand = "npx jest --watch" })
        end,
        desc = "[T]est [L]ast",
      },
    })
  end,
}
