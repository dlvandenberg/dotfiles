return {
  "epwalsh/obsidian.nvim",
  version = "*",
  lazy = true,
  ft = "markdown",
  dependencies = {
    "nvim-lua/plenary.nvim",
    -- For completion of note references
    "hrsh7th/nvim-cmp",
    -- For search and quick-fix
    "nvim-telescope/telescope.nvim",
    -- Syntax highlighting
    "nvim-treesitter/nvim-treesitter",
  },
  config = function()
    local obsidian = require("obsidian")

    vim.opt.conceallevel = 1

    obsidian.setup({
      workspaces = {
        {
          name = "brain",
          path = "~/Library/Mobile Documents/iCloud~md~obsidian/Documents/Second Brain",
        },
      },
      preferred_link_style = "wiki",
      new_notes_location = "current_dir",

      completion = {
        nvim_cmp = true,
        min_chars = 2,
      },
      attachments = {
        img_folder = "99. Attachments/Media/",
        img_text_func = function(client, path)
          local link_path
          local vault_relative_path = client:vault_relative_path(path)
          if vault_relative_path ~= nil then
            link_path = tostring(vault_relative_path)
          else
            link_path = tostring(path)
          end
          local display_name = vim.fs.basename(link_path)
          return string.format("![%s](%s)", display_name, link_path:gsub("%s+", "%%20"))
        end,
      },
      note_id_func = function(title)
        local note_name = ""
        if title ~= nil then
          note_name = title:gsub("[^A-Za-z0-9-_%s]", "-")
        else
          for _ = 1, 4 do
            note_name = note_name .. string.char(math.random(65, 90))
          end
        end
        return note_name
      end,

      follow_url_func = function(url)
        vim.fn.jobstart({ "open", url })
      end,
    })

    local keymap = vim.keymap

    keymap.set("n", "<leader>obo", ":ObsidianOpen<CR>", { desc = "[Ob]sidian [O]pen" })
    keymap.set("n", "<leader>olh", ":ObsidianFollowLink hsplit<CR>", { desc = "[O]bsidian Follow [L] [H]split" })
    keymap.set("n", "<leader>olv", ":ObsidianFollowLink vsplit<CR>", { desc = "[O]bsidian Follow [L] [V]split" })
    keymap.set("n", "<leader>obl", ":ObsidianBacklinks<CR>", { desc = "[Ob]bsidian Back[l]inks" })
  end,
}
