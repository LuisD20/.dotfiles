--------------------
--      Core      --
--------------------

require 'core.plugins'               -- Plugins + Packer Config
require 'core.keymaps'               -- Custom Keymaps
require 'core.options'               -- General Options
require 'core.colorscheme'           -- Theme of neovim

--------------------
--     Plugin     --
--------------------

require 'configs.impatient'          -- Improve Startup Time
require 'configs.better_escape'      -- Escape from insert mode without delay when typing

require 'configs.treesitter'         -- Syntax Highlighting
require 'configs.completion'         -- Auto Completion
require 'configs.dressing'           -- Neovim plugin to improve the default vim.ui interfaces
require 'configs.shade'              -- Shade is a Neovim plugin that dims your inactive windows
require 'configs.alpha'              -- Wellcome Screen

require 'configs.neotree'            -- File Explorer
require 'configs.bufferline'         -- A snazzy buffer line (with tabpage integration) for Neovim
require 'configs.heirline'           -- The ultimate Neovim Statusline for tinkerers
require 'configs.colorizer'          -- The ultimate Neovim Statusline for tinkerers

require 'configs.indentline'         -- Indentation guides to all lines
require 'configs.scrollbar'          -- Extensible Neovim Scrollbar

require 'configs.wilder'             -- A more adventurous wildmenu
require 'configs.zenmode'            -- Distraction-free coding for Neovim

require 'configs.telescope'          -- Fuzzy finder
require 'configs.proyect'            -- The superior project management solution for neovim.

require 'configs.gitsigns'           -- Git Integration
require 'configs.autopairs'          -- Autopairs
require 'configs.comment'            -- Comment toggler for Neovim written in Lua
require 'configs.toggleterm'         -- Floating Terminal

require 'configs.treesitter'         -- Treesitter syntax highlighting

--------------------
--      Utils     --
--------------------

require 'utils.utils'         
