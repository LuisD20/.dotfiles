local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {
        'git',
        'clone',
        '--depth',
        '1',
        'https://github.com/wbthomason/packer.nvim',
        install_path,
    }
    print 'Installing packer close and reopen Neovim...'
    vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, 'packer')
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init({
  display = {
    open_fn = function()
      return require('packer.util').float { border = 'rounded' }
    end,
  },
})

-- Install your plugins here
return packer.startup(function(use)

  ---------------------
  -- Genenal plugins --
  ---------------------

  use 'wbthomason/packer.nvim'                             -- A use-package inspired plugin manager for Neovim
  use 'nvim-lua/plenary.nvim'                              -- Plenary, a dependency of telescope, lua functions

  ---------------------
  --   ColorSchema   --
  ----------------------

  use 'folke/tokyonight.nvim'                              -- Color schemes

  --------------------
  --       UI       --
  --------------------

  use 'kyazdani42/nvim-web-devicons'                       -- Lua fork of vim-web-devicons for neovim
  use 'akinsho/nvim-bufferline.lua'                        -- A snazzy buffer line (with tabpage integration) for Neovim
  use 'rebelot/heirline.nvim'                              -- The ultimate Neovim Statusline for tinkerers
  use 'norcalli/nvim-colorizer.lua'                        -- A high-performance color highlighter
  use 'lukas-reineke/indent-blankline.nvim'                -- This plugin adds indentation guides to all lines
  use 'petertriho/nvim-scrollbar'                          -- Extensible Neovim Scrollbar
  use 'sunjon/shade.nvim'                                  -- Shade is a Neovim plugin that dims your inactive windows
  use 'gelguy/wilder.nvim'                                 -- A more adventurous wildmenu
  use 'stevearc/dressing.nvim'                             -- Neovim plugin to improve the default vim.ui interfaces
  use 'goolord/alpha-nvim'                                 -- Lua powered greeter like vim-startify / dashboard-nvim
  use { 'SmiteshP/nvim-navic',                             -- Simple winbar/statusline
    requires = 'neovim/nvim-lspconfig'
  }
  use { 'nvim-neo-tree/neo-tree.nvim',                     -- File explorer
    branch = 'v2.x',
    requires = 
    { 
      'nvim-lua/plenary.nvim',
      'kyazdani42/nvim-web-devicons',
      'MunifTanjim/nui.nvim',
    }
  }

  ---------------------
  --   Completions   --
  ---------------------

  use 'hrsh7th/nvim-cmp'                                  -- The completion plugin
  use { 'hrsh7th/cmp-nvim-lsp', after = 'nvim-cmp' }      -- Cmd for lsp
	use { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' }        -- Buffer completions
  use { 'hrsh7th/cmp-path', after = 'nvim-cmp' }          -- Path completions
  use { 'hrsh7th/cmp-cmdline', after = 'nvim-cmp' }       -- Cmd for terminal
	use { 'saadparwaiz1/cmp_luasnip', after = 'nvim-cmp' }  -- Cmp integration whit luasnip

  use 'neovim/nvim-lspconfig'                             -- Lsp enabled
  use 'onsails/lspkind.nvim'                              -- vs-code like icons for autocompletion
  use 'williamboman/mason.nvim' -- simple to use language server installer
  use { 'williamboman/mason-lspconfig.nvim', after = { 'mason.nvim', 'nvim-lspconfig' } } -- config for mason
  use 'jose-elias-alvarez/null-ls.nvim' -- for formatters and linters
	use { 'jayp0521/mason-null-ls.nvim', after = { 'mason.nvim', 'null-ls.nvim' }} -- bridges gap b/w mason & null-ls

  use { 'L3MON4D3/LuaSnip', wants = 'friendly-snippets' } -- Snippets engien
	use { 'rafamadriz/friendly-snippets', opt = true }      -- Useful snippets

  --------------------
  --     Finders    --
  --------------------

  use { 'nvim-telescope/telescope.nvim',                  -- Fuzzy finder
    tag = '0.1.0',
    requires = {'nvim-lua/plenary.nvim'}
  }
  use 'nvim-telescope/telescope-media-files.nvim'         -- Telescope extension to preview media files using Ueberzug.
  use 'ahmedkhalf/project.nvim'                           -- The superior project management solution for neovim.
  use { 'nvim-telescope/telescope-fzf-native.nvim',       -- FZF sorter for telescope written in c
    after = 'telescope.nvim',
    disable = vim.fn.executable 'make' == 0,
    run = 'make'
  }

  --------------------
  --     Memory     --
  --------------------

  use 'lewis6991/impatient.nvim'                          -- Improve startup time for Neovim
  use 'max397574/better-escape.nvim'                      -- Escape from insert mode without delay when typing

  --------------------
  --      Git       --
  --------------------

	use 'lewis6991/gitsigns.nvim'                           -- Git integration for buffers

  --------------------
  --      Utils     --
  --------------------

  use { 'windwp/nvim-autopairs', after = 'nvim-treesitter', } -- Autopairs
  use { 'windwp/nvim-ts-autotag', after = 'nvim-treesitter' } -- Autoclose tags
  use 'terrortylor/nvim-comment'                              -- Comment toggler for Neovim written in Lua
  use 'JoosepAlviste/nvim-ts-context-commentstring'           -- commentstring based on the cursor 
  use 'akinsho/toggleterm.nvim'                               -- Manage multiple terminal windows
  --use 'kevinhwang91/nvim-hlslens'                           -- Hlsearch Lens for Neovim

  --------------------
  --     Syntax     --
  --------------------

  use 'nvim-treesitter/nvim-treesitter'                       -- Treesitter syntax highlighting


  -- lsp config
  --use 'stevearc/aerial.nvim'
  --use 'folke/lsp-colors.nvim'

  --use 'Shatur/neovim-session-manager'
  --use({ 'toppair/peek.nvim', run = 'deno task --quiet build:fast' })
  --use 'rcarriga/nvim-notify'
  --use {'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async'}
  --use { 'folke/trouble.nvim', requires = 'kyazdani42/nvim-web-devicons' }


  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require('packer').sync()
  end
end)
