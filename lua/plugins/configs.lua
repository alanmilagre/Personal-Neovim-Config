-- lua/plugins/configs.lua

return {
  -- Basic Debugging Support
  {
    'mfussenegger/nvim-dap',
    config = function()
      local dap = require('dap')
      dap.adapters.lua = function(callback, _)
        callback({ type = 'executable', command = 'lua', args = { '-e', 'debugger' } })
      end
      dap.configurations.lua = {
        {
          type = 'lua',
          request = 'launch',
          name = 'Launch Lua file',
          program = '${file}',
        },
      }
    end,
  },

  -- Integrated Terminal
  {
    "akinsho/toggleterm.nvim",
    config = function()
      require("toggleterm").setup {
        size = 20,
        open_mapping = [[<c-\>]],
        direction = "float",
        close_on_exit = true,
      }
    end,
  },

  -- Project Navigation & Window Management
  {
    'akinsho/bufferline.nvim',
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      require("bufferline").setup({
  options = {
    numbers = "ordinal",
    close_command = "bdelete! %d",
    right_mouse_command = "bdelete! %d",
    left_mouse_command = "buffer %d",
    indicator = { icon = "▎", style = "icon" },

    -- 🔧 Fixed icons
    buffer_close_icon = "",  -- Font Awesome 'times' icon (U+F00D)
    modified_icon = "●",
    close_icon = "",         -- same glyph for consistency

    show_buffer_icons = true,
    show_tab_indicators = true,
    persist_buffer_sort = true,
    separator_style = "thin",
    always_show_bufferline = true,
  },
})

    end,
  },

  -- Code Runner
  {
    "CRAG666/code_runner.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    config = function()
      require("code_runner").setup {
        mode = "term",
        focus = true,
        startinsert = true,
        term = { position = "vertical", size = 50 },
      }
    end,
  },

  -- Appearance
  { "rebelot/kanagawa.nvim" },

  -- Core Editing Enhancements
  {
    'numToStr/Comment.nvim',
    config = function() require('Comment').setup() end,
  },
  {
    'kylechui/nvim-surround',
    config = function() require('nvim-surround').setup() end,
  },

  -- File Explorer
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function() require('nvim-tree').setup() end,
  },

  -- Fuzzy Finder
  {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
  },
  
-- Dashboard
{
  'goolord/alpha-nvim',
  config = function()
    local alpha = require('alpha')
    local dashboard = require('alpha.themes.dashboard')

    -- Header
    dashboard.section.header.val = {
      "███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗",
      "████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║",
      "██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║",
      "██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║",
      "██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║",
      "╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝",
    }

    -- Buttons
    dashboard.section.buttons.val = {
      dashboard.button("f", "  Find File", ":Telescope find_files<CR>"),
      dashboard.button("r", "  Recent Files", ":Telescope oldfiles<CR>"),
      dashboard.button("n", "  New File", ":ene | startinsert <CR>"),
      dashboard.button("c", "  Edit Config", ":e ~/.config/nvim/init.lua <CR>"),
      dashboard.button("q", "  Quit", ":qa<CR>"),
    }

    -- Footer
    dashboard.section.footer.val = "Personal Neovim Config v0.6 - by alanmilagre"

    -- Setup
    alpha.setup(dashboard.opts)
  end,
},

  -- Syntax Highlighting
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
      require('nvim-treesitter.configs').setup {
        highlight = { enable = true },
        indent = { enable = true },
      }
    end,
  },

  -- Status Line
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('lualine').setup {
        options = {
          theme = 'gruvbox',
          section_separators = { left = '', right = '' },
          component_separators = { left = '', right = '' },
          icons_enabled = true,
        },
        sections = {
          lualine_a = {'mode'},
          lualine_b = {'branch', 'diff', 'diagnostics'},
          lualine_c = {'filename'},
          lualine_x = {'encoding', 'fileformat', 'filetype'},
          lualine_y = {'progress'},
          lualine_z = {'location'},
        },
      }
    end,
  },

  -- Git Integration
  {
    'lewis6991/gitsigns.nvim',
    config = function() require('gitsigns').setup() end,
  },

  -- Which-Key
  {
    'folke/which-key.nvim',
    config = function() require('which-key').setup() end,
  },
}
