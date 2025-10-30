-- lua/core/keymaps.lua
vim.g.mapleader = " "

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Save & Quit
keymap("n", "<leader>w", ":w<CR>", opts)
keymap("n", "<leader>q", ":q<CR>", opts)

-- Window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", opts)


-- Window Navigation Improvements
vim.keymap.set("n", "<leader>bn", ":bnext<CR>", { noremap=true, silent=true })
vim.keymap.set("n", "<leader>bp", ":bprevious<CR>", { noremap=true, silent=true })

-- Buffer navigation
keymap("n", "<leader>bn", ":bnext<CR>", opts)
keymap("n", "<leader>bp", ":bprevious<CR>", opts)
keymap("n", "<leader>bd", ":bdelete<CR>", opts)

-- Window resizing (Alt + arrow keys)
keymap("n", "<M-Up>", ":resize +2<CR>", opts)
keymap("n", "<M-Down>", ":resize -2<CR>", opts)
keymap("n", "<M-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<M-Right>", ":vertical resize +2<CR>", opts)

-- nvim-dap debugging keymaps
keymap("n", "<leader>db", ":lua require'dap'.toggle_breakpoint()<CR>", opts)
keymap("n", "<leader>dc", ":lua require'dap'.continue()<CR>", opts)
keymap("n", "<leader>di", ":lua require'dap'.step_into()<CR>", opts)
keymap("n", "<leader>do", ":lua require'dap'.step_over()<CR>", opts)
keymap("n", "<leader>dO", ":lua require'dap'.step_out()<CR>", opts)
keymap("n", "<leader>dr", ":lua require'dap'.repl.toggle()<CR>", opts)

-- Better indenting
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Clear search highlight
keymap("n", "<leader>h", ":nohlsearch<CR>", opts)

-- Quick source/reload
keymap("n", "<leader>so", ":source %<CR>", opts)

-- Run Love2D project
keymap("n", "<leader>r", function()
    -- Get the current file's directory
    local file_dir = vim.fn.expand("%:p:h")
    -- Check if main.lua exists in this folder
    if vim.fn.filereadable(file_dir .. "/main.lua") == 1 then
        -- Run Love2D in a terminal split
        vim.cmd("split | terminal love " .. file_dir)
    else
        print("No main.lua found in this directory!")
    end
end, opts)

-- Which-key 
local ok, wk = pcall(require, "which-key")
if not ok then return end

wk.setup()

wk.add({
  { "<leader>b", group = "Buffers" },
  { "<leader>c", group = "Coding / LSP" },
  { "<leader>f", group = "Files / Fuzzy Finder" },
  { "<leader>g", group = "Git" },
  { "<leader>r", group = "Run / Debug" },
  { "<leader>t", group = "Terminal" },
  { "<leader>w", group = "Window / Tabs" },
})