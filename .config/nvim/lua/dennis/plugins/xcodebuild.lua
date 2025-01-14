return {
  "wojciech-kulik/xcodebuild.nvim",
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-tree.lua", -- (optional) to manage project files
    "stevearc/oil.nvim", -- (optional) to manage project files
    "nvim-treesitter/nvim-treesitter", -- (optional) for Quick tests support (required Swift parser)
  },
  config = function()
    require("xcodebuild").setup({
      -- put some options here or leave it empty to use default settings
    })

    local wk = require("which-key")

    wk.add({
      { "<leader>xC", "<CMD>XcodebuildSetup<CR>", desc = "[X]code [C]onfigure" },
      { "<leader>X", "<CMD>XcodebuildPicker<CR>", desc = "Show [X]codebuild Actions" },
      { "<leader>xf", "<CMD>XcodebuildProjectManager<CR>", desc = "Show Project Manager Actions" },
      -- Build
      { "<leader>xb", "<CMD>XcodebuildBuild<CR>", desc = "[X]code [B]uild project" },
      { "<leader>xB", "<CMD>XcodebuildBuildForTesting<CR>", desc = "[X]code [B]uild project for Testing" },
      { "<leader>xr", "<CMD>XcodebuildBuildRun<CR>", desc = "[X]code [R]un project" },
      -- Tests
      { "<leader>xt", "<CMD>XcodebuildTest<CR>", desc = "[X]code Run [T]ests" },
      { "<leader>xT", "<CMD>XcodebuildTestClass<CR>", desc = "[X]code Run Current Class [T]ests" },
      { "<leader>x.", "<CMD>XcodebuildTestRepeat<CR>", desc = "[X]code Repeat Last Tests" },
      -- Selection
      { "<leader>xd", "<CMD>XcodebuildSelectDevice<CR>", desc = "[X]code Select [D]evice" },
      { "<leader>xp", "<CMD>XcodebuildSelectTestPlan<CR>", desc = "[X]code Select Test [P]lan" },
      -- Logs
      { "<leader>xl", "<CMD>XcodebuildToggleLogs<CR>", desc = "[X]code Toggle [L]ogs" },
    })

    -- vim.keymap.set("n", "<leader>xb", "<cmd>XcodebuildBuild<cr>", { desc = "Build Project" })
    -- vim.keymap.set("n", "<leader>xB", "<cmd>XcodebuildBuildForTesting<cr>", { desc = "Build For Testing" })
    -- vim.keymap.set("n", "<leader>xr", "<cmd>XcodebuildBuildRun<cr>", { desc = "Build & Run Project" })
    --
    -- vim.keymap.set("n", "<leader>xt", "<cmd>XcodebuildTest<cr>", { desc = "Run Tests" })
    -- vim.keymap.set("v", "<leader>xt", "<cmd>XcodebuildTestSelected<cr>", { desc = "Run Selected Tests" })
    -- vim.keymap.set("n", "<leader>xT", "<cmd>XcodebuildTestClass<cr>", { desc = "Run Current Test Class" })
    -- vim.keymap.set("n", "<leader>x.", "<cmd>XcodebuildTestRepeat<cr>", { desc = "Repeat Last Test Run" })
    --
    -- vim.keymap.set("n", "<leader>xl", "<cmd>XcodebuildToggleLogs<cr>", { desc = "Toggle Xcodebuild Logs" })
    -- vim.keymap.set("n", "<leader>xc", "<cmd>XcodebuildToggleCodeCoverage<cr>", { desc = "Toggle Code Coverage" })
    -- vim.keymap.set(
    --   "n",
    --   "<leader>xC",
    --   "<cmd>XcodebuildShowCodeCoverageReport<cr>",
    --   { desc = "Show Code Coverage Report" }
    -- )
    -- vim.keymap.set("n", "<leader>xe", "<cmd>XcodebuildTestExplorerToggle<cr>", { desc = "Toggle Test Explorer" })
    -- vim.keymap.set("n", "<leader>xs", "<cmd>XcodebuildFailingSnapshots<cr>", { desc = "Show Failing Snapshots" })
    --
    -- vim.keymap.set("n", "<leader>xd", "<cmd>XcodebuildSelectDevice<cr>", { desc = "Select Device" })
    -- vim.keymap.set("n", "<leader>xp", "<cmd>XcodebuildSelectTestPlan<cr>", { desc = "Select Test Plan" })
    -- vim.keymap.set("n", "<leader>xq", "<cmd>Telescope quickfix<cr>", { desc = "Show QuickFix List" })
    --
    -- vim.keymap.set("n", "<leader>xx", "<cmd>XcodebuildQuickfixLine<cr>", { desc = "Quickfix Line" })
    -- vim.keymap.set("n", "<leader>xa", "<cmd>XcodebuildCodeActions<cr>", { desc = "Show Code Actions" })
  end,
}
