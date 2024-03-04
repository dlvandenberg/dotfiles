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
      completion = {
        nvim_cmp = true,
        min_chars = 2,
        new_notes_location = "current_dir",
        preferred_link_style = "wiki",
        prepend_note_id = true,
      },
      attachments = {
        img_folder = "99.%20Attachments/Media/",
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
    })

    local keymap = vim.keymap

    keymap.set("n", "<leader>obo", ":ObsidianOpen<CR>", { desc = "[Ob]sidian [O]pen" })
    keymap.set("n", "<leader>olh", ":ObsidianFollowLink hsplit<CR>", { desc = "[O]bsidian Follow [L] [H]split" })
    keymap.set("n", "<leader>olv", ":ObsidianFollowLink vsplit<CR>", { desc = "[O]bsidian Follow [L] [V]split" })
    keymap.set("n", "<leader>obl", ":ObsidianBacklinks<CR>", { desc = "[Ob]bsidian Back[l]inks" })
  end,
}
