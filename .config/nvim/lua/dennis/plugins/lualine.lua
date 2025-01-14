return {
  "nvim-lualine/lualine.nvim",
  config = function()
    local lualine = require("lualine")
    local lazy_status = require("lazy.status")

    -- xcodebuild config
    local function xcodebuild_device()
      if vim.g.xcodebuild_platform == "macOS" then
        return " macOS"
      end

      local deviceIcon = ""
      if vim.g.xcodebuild_platform:match("watch") then
        deviceIcon = "􀟤"
      elseif vim.g.xcodebuild_platform:match("tv") then
        deviceIcon = "􀡴 "
      elseif vim.g.xcodebuild_platform:match("vision") then
        deviceIcon = "􁎖 "
      end

      if vim.g.xcodebuild_os then
        return deviceIcon .. " " .. vim.g.xcodebuild_device_name .. " (" .. vim.g.xcodebuild_os .. ")"
      end

      return deviceIcon .. " " .. vim.g.xcodebuild_device_name
    end

    lualine.setup({
      options = {
        icons_enabled = true,
        theme = "mountnugget",
        component_separators = "|",
        section_separators = "",
      },
      sections = {
        lualine_x = {
          { "' ' .. vim.g.xcodebuild_last_status", color = { fg = "#908D75" } },
          { "'󰙨 ' .. vim.g.xcodebuild_test_plan", color = { fg = "#96BF73" } },
          { xcodebuild_device, color = { fg = "#9F7F92" } },
          {
            lazy_status.updates,
            cond = lazy_status.has_updates,
            color = { fg = "#CE9178" },
          },
          { "encoding" },
          { "fileformat" },
          { "filetype" },
        },
        lualine_c = {
          {
            "filename",
            file_status = true,
            newfile_status = true,
            path = 1,
            symbols = {
              modified = "[+]",
              readonly = "[-]",
              unnamed = "[No Name]",
              newfile = "[New]",
            },
          },
        },
      },
    })
  end,
}
