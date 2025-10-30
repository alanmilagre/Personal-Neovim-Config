# Personal Neovim Configuration v0.6

A basic Neovim setup, made by someone who still doesn’t fully understand Vim but keeps trying anyway.

This version marks a major update, moving from **Packer** to **Lazy**, and targets **Neovim v0.12.0-dev** and above.

---

## Structure

```
~/.config/nvim/
├── init.lua
└── lua/
├── core/
│ ├── keymaps.lua → Keybindings & leader shortcuts
│ └── options.lua → Core editor settings
└── plugins/
├── plugin.lua → Lazy.nvim bootstrap & setup
└── configs.lua → Plugin configurations
```


---

## What's New in v0.6

- Migrated from **Packer** → **Lazy.nvim**
- Updated base Neovim version to **v0.12.0-dev**
- Reorganized file structure for better readability
- Changed default theme to **kanagawa-dragon**
- General plugin cleanup and better load management

---

## Core Features

### General
- Basic options: line numbers, cursorline, indentation, clipboard, etc.  
- Leader key: Space (`<Space>`)  
- Smooth navigation: `<C-h/j/k/l>` between splits  
- Alt + arrows for resizing windows  
- Quick buffer control: `<leader>bn/bp/bd>`  

### Appearance
- Colorscheme: **Kanagawa Dragon**  
- Statusline: **lualine.nvim**  
- Bufferline for tab navigation  
- Treesitter syntax highlighting  
- Dashboard via **alpha-nvim**

### Navigation & Productivity
- File tree (**nvim-tree**)  
- Fuzzy finder (**telescope**)  
- Git integration (**gitsigns.nvim**)  
- Floating terminal (**toggleterm**)  
- Which-key hints for leader shortcuts  
- Code Runner integration (**code_runner.nvim**)  
- Basic debugging via **nvim-dap**

### Love2D Runner
Because I need it:  
`<leader>r` — Runs the current folder with Love2D if `main.lua` is present.

---

## Plugin Manager: Lazy.nvim

Lazy.nvim is automatically bootstrapped at startup.  
If it’s missing, it’ll be cloned from GitHub and set up for you.

**Default colorscheme:** `kanagawa`  
**Auto-update checker:** enabled  

Plugins and configs live inside `lua/plugins/`.

---

## Requirements

- **Neovim v0.12.0-dev+**  
- **Git**  
- Nerd Fonts
- (Optional) **Love2D**, if you want to use the `<leader>r` runner

---

## Installation

```bash
git clone https://github.com/alanmilagre/nvim ~/.config/nvim
```
### Launch Neovim

Open you terminal and launch Neovim and let Lazy install the plugins:

```bash
nvim
```

## Notes
 
- Wouldn't recommend as a daily driver — unless you want to learn from any mistakes I might've made or you just like its current state and want to make it your own

---

## Roadmap / Planned (v0.7+)

- Optional light theme toggle (kanagawa-lotus)
- Maybe rework the current keymaps
- Maybe add keymaps for git commands 
- LSPs goodies 

---

## Credits

Made by [**alanmilagre**]
