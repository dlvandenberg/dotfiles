return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
  },
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")
    local telescope = require("telescope").extensions.dap
    -- ╭─────────────────────────────────────────────────────────╮
    -- │ Adapters                                                │
    -- ╰─────────────────────────────────────────────────────────╯
    dap.adapters["pwa-node"] = {
      type = "server",
      host = "localhost",
      port = "${port}",
      executable = {
        command = "js-debug-adapter",
        args = { "${port}" },
      },
    }

    -- ╭─────────────────────────────────────────────────────────╮
    -- │ Configurations                                          │
    -- ╰─────────────────────────────────────────────────────────╯
    local languages = {
      "javascript",
      "typescript",
      "svelte",
    }
    for _, language in ipairs(languages) do
      dap.configurations[language] = {
        {
          type = "pwa-node",
          request = "launch",
          name = "Launch Current File (pwa-node)",
          cwd = vim.fn.getcwd(),
          args = { "${file}" },
          sourceMaps = true,
          protocol = "inspector",
          -- runtimeExecutable = "npm",
          -- runtimeArgs = {
          --   "run-script", "dev",
          -- },
          -- resolveSourceMapLocations = {
          --   "${workspaceFolder}/**",
          --   "!**/node_modules/**",
          -- },
        },
        {
          type = "pwa-node",
          request = "launch",
          name = "Launch Current File (pwa-node with ts-node)",
          cwd = vim.fn.getcwd(),
          args = { "${file}" },
          sourceMaps = true,
          protocol = "inspector",
          runtimeExecutable = "node",
          runtimeArgs = {
            "--loader",
            "ts-node/esm",
          },
          resolveSourceMapLocations = {
            vim.fn.getcwd() .. "/**",
            "!**/node_modules/**",
          },
          skipFiles = { "<node_internals>/**", "node_modules/**" },
        },
        {
          type = "pwa-node",
          request = "attach",
          name = "Attach Program (pwa-node, select pid)",
          cwd = vim.fn.getcwd(),
          processId = require("dap.utils").pick_process,
          skipFiles = { "<node_internals>/**" },
        },
      }
    end

    -- ╭─────────────────────────────────────────────────────────╮
    -- │ Keymaps                                                 │
    -- ╰─────────────────────────────────────────────────────────╯
    local opts = { noremap = true, silent = true }
    local get_opts = require("utils").create_get_opts(opts)

    local keymap = vim.keymap
    keymap.set("n", "<leader>db", dap.toggle_breakpoint, get_opts({ desc = "[D]ebug [B]reakpoint" }))
    keymap.set("n", "<leader>dB", function()
      dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
    end, get_opts({ desc = "Set Conditional Breakpoint" }))

    keymap.set("n", "<leader>dc", dap.continue, get_opts({ desc = "[D]ebug [C]ontinue" }))
    keymap.set("n", "<leader>dn", dap.step_over, get_opts({ desc = "[D]ebug [N]ext" }))
    keymap.set("n", "<leader>di", dap.step_into, get_opts({ desc = "[D]ebug Step [I]nto" }))
    keymap.set("n", "<leader>do", dap.step_out, get_opts({ desc = "[D]ebug Step [O]ut" }))
    keymap.set("n", "<leader>dr", dap.repl.open, get_opts({ desc = "[D]ebug [R]epl" }))
    keymap.set("n", "<leader>dx", function()
      dap.disconnect({ terminateDebuggee = true })
    end, get_opts({ desc = "[D]ebug [X] Disconnect" }))

    -- ╭─────────────────────────────────────────────────────────╮
    -- │ DAP UI                                                  │
    -- ╰─────────────────────────────────────────────────────────╯
    dapui.setup()
    keymap.set("n", "<leader>du", dapui.toggle, get_opts({ desc = "[D]ebug [U]I" }))

    dap.listeners.after.event_initialized["dapui_config"] = function()
      dapui.open()
    end

    dap.listeners.before.event_terminated["dapui_config"] = function()
      dapui.close()
    end

    dap.listeners.before.event_exited["dapui_config"] = function()
      dapui.close()
    end
    -- ╭─────────────────────────────────────────────────────────╮
    -- │ Telescope DAP                                           │
    -- ╰─────────────────────────────────────────────────────────╯
    keymap.set("n", "<leader>dm", telescope.commands, get_opts({ desc = "[D]ebug [C]ommands" }))
    keymap.set("n", "<leader>dl", telescope.list_breakpoints, get_opts({ desc = "[D]ebug Breakpoint [L]ist" }))
    keymap.set("n", "<leader>dv", telescope.variables, get_opts({ desc = "[D]ebug [V]ariables" }))
    keymap.set("n", "<leader>df", telescope.frames, get_opts({ desc = "[D]ebug [F]rames" }))
  end,
}
