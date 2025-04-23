vim.opt.number        = true   -- Make line numbers default
vim.o.relativenumber  = true   -- Set relative numbered lines

vim.o.foldenable      = true   -- enable fold
vim.o.foldlevel       = 99     -- Start editing with all folds opened
vim.o.foldmethod      = "expr" -- use tree-sitter for folding method
vim.o.foldexpr        = "v:lua.vim.treesitter.foldexpr()"

vim.o.wrap            = false -- Display lines as one long line
vim.o.linebreak       = true  -- don't split words
vim.o.autoindent      = true  -- Copy indent from current line
vim.o.ignorecase      = true  -- case insensitive searching
vim.o.smartcase       = true  -- Smart case

vim.o.shiftwidth      = 2     -- number of spaces
vim.o.tabstop         = 2     -- Insert n spaces for a tab
vim.o.softtabstop     = 2     -- number of spaces that tab counts for
vim.o.expandtab       = true  -- Convert tabs to spaces
vim.o.scrolloff       = 8     -- Minimal number of lines to keep above and below the cursor

vim.o.sidescrolloff   = 8     -- Minimal number of lines to show at either side of the cursor
vim.o.cursorline      = true  -- highlight the current line

vim.o.splitbelow      = true  -- Force all horizontal splits to go below current window
vim.o.splitright      = true  -- Force all vertical splits to go to the right of current window

vim.o.hlsearch        = true  -- Set highlight on search
vim.opt.termguicolors = true  -- Enable highlight groups


vim.o.nu = true

vim.o.smartindent = true -- Make indenting smarter again


vim.o.swapfile = false -- create swap file
vim.o.backup = false
vim.o.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.o.undofile = true

vim.o.incsearch = true

vim.o.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.o.updatetime = 50
vim.o.colorcolumn = "120"

vim.g.mapleader = " "
vim.o.winborder = "rounded"
vim.o.completeopt = "menuone,noselect" -- Set completeopt to have better completion experience
