return {
  "akinsho/flutter-tools.nvim",
  lazy = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "stevearc/dressing.nvim", -- optional for vim.ui.select
  },
  config = function()
    require("flutter-tools").setup({
      flutter_path = "/opt/homebrew/bin/flutter",
      fvm = false,
      decorations = {
        statusline = {
          app_version = false,
          device = true,
          project_config = true,
        },
      },
      lsp = {
        settings = {
          showtodos = true,
          completefunctioncalls = true,
          analysisexcludedfolders = {
            vim.fn.expand("$Home/.pub-cache"),
          },
          renamefileswithclasses = "prompt",
          updateimportsonrename = true,
          enablesnippets = false,
        },
      },
      debugger = {
        enabled = false,
        run_via_dap = true,
        exception_breakpoints = {},
        register_configurations = function(paths)
          local dap = require("dap")
          dap.adapters.dart = {
            type = "executable",
            command = paths.flutter_bin,
            args = { "debug-adapter" },
          }
          dap.configurations.dart = {}
          require("dap.ext.vscode").load_launchjs()
        end,
      },
      root_patterns = { ".git", "pubspec.yaml" },
    })
  end,
}
