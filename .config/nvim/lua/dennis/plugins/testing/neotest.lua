return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    -- Adapters
    "nvim-neotest/neotest-jest",
    "nvim-neotest/neotest-plenary",
    -- Debugging
    "mfussenegger/nvim-dap",
  },
  config = function()
    local neotest = require("neotest")
    local jest = require("neotest-jest")

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
      },
    })

    local keymap = vim.keymap

    keymap.set("n", "<leader>tt", neotest.run.run, { desc = "[T]est File" })
    keymap.set("n", "<leader>to", neotest.output.open, { desc = "[T]est [O]utput" })
    keymap.set("n", "<leader>tp", neotest.output_panel.toggle, { desc = "[T]est Output [P]anel" })
    keymap.set("n", "<leader>ts", neotest.summary.toggle, { desc = "[T]est [S]ummary" })
    keymap.set("n", "<leader>tl", neotest.run.run_last, { desc = "[T]est] [L]ast" })
    keymap.set("n", "<leader>tw", neotest.watch.toggle, { desc = "[T]est] [W]atch" })
    keymap.set("n", "<leader>td", function()
      neotest.run.run({ vim.fn.expand("%"), strategy = "dap" })
    end, { desc = "[T]est [D]ebug" })

    -- -- Debugging keymaps
    -- local dap = require("dap")
    -- keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "[D]ebug [B]reakpoint" })
    -- keymap.set("n", "<leader>dB", function()
    --   dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
    -- end, { silent = true, noremap = true, desc = "Set Conditional Breakpoint" })
    --
    -- keymap.set("n", "<leader>dc", dap.continue, { desc = "[D]ebug [C]ontinue" })
    -- keymap.set("n", "<leader>dn", dap.step_over, { desc = "[D]ebug [N]ext" })
    -- keymap.set("n", "<leader>di", dap.step_into, { desc = "[D]ebug Step [I]nto" })
    -- keymap.set("n", "<leader>do", dap.step_out, { desc = "[D]ebug Step [O]ut" })
    -- keymap.set("n", "<leader>dr", dap.repl.open, { desc = "[D]ebug [R]epl" })
  end,
}
