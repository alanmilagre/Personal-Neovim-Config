-- lua/core/options.lua
local opt = vim.opt

-- UI
opt.number = true
opt.relativenumber = false
opt.signcolumn = "yes"
opt.termguicolors = true
opt.cursorline = true
opt.wrap = false

-- Tabs & indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.smartindent = true

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false
opt.incsearch = true

-- Performance
opt.updatetime = 300
opt.timeoutlen = 400

-- System clipboard
opt.clipboard = "unnamedplus"

-- Cursorline tweaks

vim.opt.cursorline = true
vim.cmd("highlight CursorLine guibg=#3c3836")

-- Session options (for auto-session)
vim.opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize", "winpos", "terminal", "localoptions" }

-- Others
opt.scrolloff = 8
opt.splitright = true
opt.splitbelow = true

--Default theme
vim.cmd("colorscheme kanagawa-dragon")

