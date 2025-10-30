-- lua/core/keymaps.lua
vim.g.mapleader = " "

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-----------------------------------------------------------
-- BASIC KEYMAPS
-----------------------------------------------------------

-- Save / Quit
keymap("n", "<leader>w", ":w<CR>", opts)
keymap("n", "<leader>q", ":q<CR>", opts)
keymap("n", "<leader>Q", ":qa!<CR>", opts)  -- Force quit all

-- Clear search highlight
keymap("n", "<leader>h", ":nohlsearch<CR>", opts)

-- Reload current config file
keymap("n", "<leader>so", ":source %<CR>", opts)

-----------------------------------------------------------
-- WINDOW & TAB NAVIGATION
-----------------------------------------------------------

-- Move between splits
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize splits (Alt + Arrows)
keymap("n", "<M-Up>", ":resize +2<CR>", opts)
keymap("n", "<M-Down>", ":resize -2<CR>", opts)
keymap("n", "<M-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<M-Right>", ":vertical resize +2<CR>", opts)

-- Buffer / Tab navigation
keymap("n", "<leader>bn", ":bnext<CR>", opts)
keymap("n", "<leader>bp", ":bprevious<CR>", opts)
keymap("n", "<leader>bd", ":bdelete<CR>", opts)

-----------------------------------------------------------
-- PLUGIN SHORTCUTS
-----------------------------------------------------------

-- File Tree (NvimTree)
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

-- Telescope shortcuts (if installed)
keymap("n", "<leader>ff", ":Telescope find_files<CR>", opts)
keymap("n", "<leader>fg", ":Telescope live_grep<CR>", opts)
keymap("n", "<leader>fr", ":Telescope oldfiles<CR>", opts)

-- Toggle between Kanagawa Lotus and Dragon themes
local current_theme = "kanagawa-lotus"

keymap("n", "<leader>tt", function()
  if current_theme == "kanagawa-lotus" then
    vim.cmd("colorscheme kanagawa-dragon")
    current_theme = "kanagawa-dragon"
    print("🐉 Theme: Kanagawa Dragon")
  else
    vim.cmd("colorscheme kanagawa-lotus")
    current_theme = "kanagawa-lotus"
    print("🌸 Theme: Kanagawa Lotus")
  end
end, opts)


-----------------------------------------------------------
-- WHICH-KEY GROUPS (Optional)
-----------------------------------------------------------
local ok, wk = pcall(require, "which-key")
if ok then
  wk.setup()
  wk.add({
    { "<leader>f", group = "Files / Search" },
    { "<leader>b", group = "Buffers / Tabs" },
    { "<leader>t", group = "Theme / UI" },
    { "<leader>w", group = "Write / Quit" },
  })
end
