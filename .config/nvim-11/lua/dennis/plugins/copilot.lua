return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    opts = {
      suggestion = { enabled = false },
      panel = { enabled = false },
    },
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "main",
    dependencies = {
      { "zbirenbaum/copilot.lua" },
      { "nvim-lua/plenary.nvim" },
    },
    opts = {
      debug = false,
      model = "claude-3.7-sonnet",
      show_help = "yes",
      prompts = {
        Explain = "Explain how it works.",
        Review = "Review the following code and provide concise suggestions.",
        Tests = "Briefly explain how the selected code works, then generate unit tests.",
        Refactor = "Refactor the code to improve clarity and readability",
      },
      mappings = {
        close = {
          insert = "<C-q>",
          normal = "<C-x>",
        },
        reset = {
          insert = "<C-r>",
          normal = "<C-r>",
        },
      },
    },
    build = function()
      vim.notify("Please update the remote plugins by running ':UpdateRemotePlugins', then restart Neovim.")
    end,
    event = "VeryLazy",
    keys = {
      { "<leader>ccc", "<CMD>CopilotChatToggle<CR>", desc = "[C]opilot [C]hat - Toggle [C]hat" },
      { "<leader>cce", "<CMD>CopilotChatExplain<CR>", desc = "[C]opilot [C]hat - [E]xplain" },
      { "<leader>cct", "<CMD>CopilotChatTests<CR>", desc = "[C]opilot [C]hat - Generate [T]ests" },
      { "<leader>ccr", "<CMD>CopilotChatReview<CR>", desc = "[C]opilot [C]hat - [R]eview Code" },
      { "<leader>ccR", "<CMD>CopilotChatRefactor<CR>", desc = "[C]opilot [C]hat - [R]efactor Code" },
      { "<leader>ccm", "<CMD>CopilotChatModels<CR>", desc = "[C]opilot [C]hat - AI [M]odels" },
    },
  },
}
