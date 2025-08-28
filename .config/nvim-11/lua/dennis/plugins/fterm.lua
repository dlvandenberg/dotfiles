---@diagnostic disable: missing-fields
return {
  "numToStr/FTerm.nvim",
  event = "VeryLazy",
  config = function()
    local fterm = require("FTerm")
    local wk = require("which-key")
    local sourceEnv = "source ~/.envrc &&"

    wk.add({
      { "<leader>j", group = "[J]ira" },
      {
        "<leader>js",
        function()
          fterm.scratch({
            auto_close = true,
            cmd = sourceEnv .. "jira sprint list --current -s~closed --order-by type --reverse",
          })
        end,
        desc = "[J]ira [S]print board",
      },
      {
        "<leader>jm",
        function()
          fterm.scratch({
            auto_close = true,
            cmd = sourceEnv .. "jira sprint list --current -a$(jira me) --order-by type --reverse -s~closed",
          })
        end,
        desc = "[J]ira [M]y sprint issues",
      },
      {
        "<leader>jb",
        function()
          fterm.scratch({
            auto_close = true,
            cmd = sourceEnv
              .. "jira issue list -q 'summary ~ FE and sprint is EMPTY' -s~closed -s~'Acceptance' -s~'To Refine' -s~'New' --order-by rank --reverse",
          })
        end,
        desc = "[J]ira [B]acklog Frontend",
      },
      {
        "<leader>ju",
        function()
          local key = vim.fn.input("Issue key: ")
          fterm.scratch({
            auto_close = true,
            cmd = sourceEnv .. "jira issue assign " .. key .. " x",
          })
        end,
        desc = "[J]ira [U]nassign",
      },
      {
        "<leader>ja",
        function()
          local key = vim.fn.input("Issue key: ")
          fterm.scratch({
            auto_close = true,
            cmd = sourceEnv .. "jira issue assign " .. key,
          })
        end,
        desc = "[J]ira [A]ssign",
      },
      {
        "<leader>je",
        function()
          fterm.scratch({
            auto_close = true,
            cmd = sourceEnv .. "jira issue list -a$(jira me) -p ERIS -s~closed --order-by type --reverse",
          })
        end,
        desc = "[J]ira My [E]ris issues",
      },
    })
  end,
}
