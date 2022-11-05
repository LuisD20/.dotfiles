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
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, 'packer')
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require('packer.util').float { border = 'rounded' }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)

  -- packer
  use 'wbthomason/packer.nvim'

  -- lua functions
  use 'nvim-lua/plenary.nvim'

  -- color schemes
  use 'folke/tokyonight.nvim'

  -- file explorer
  --use { 'nvim-tree/nvim-tree.lua', requires = { 'nvim-tree/nvim-web-devicons', } }
  use {
    "nvim-neo-tree/neo-tree.nvim",
      branch = "v2.x",
      requires = { 
        "nvim-lua/plenary.nvim",
        "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
      }
    }

  -- icons
  use 'nvim-tree/nvim-web-devicons'

  -- status line
  --use 'nvim-lualine/lualine.nvim'
  use 'akinsho/nvim-bufferline.lua'
  use 'rebelot/heirline.nvim'
  use 'SmiteshP/nvim-navic'
  
  -- fuzzy finder
  use 'nvim-telescope/telescope.nvim'
  use "nvim-telescope/telescope-media-files.nvim"
  use 'ahmedkhalf/project.nvim'
  use { "nvim-telescope/telescope-fzf-native.nvim", 
    after = "telescope.nvim",
    disable = vim.fn.executable "make" == 0,
    run = "make"
  }

  -- completions plugins
  use 'hrsh7th/nvim-cmp' -- The completion plugin
	use { 'saadparwaiz1/cmp_luasnip', after = "nvim-cmp" } -- for autocompletion
	use { 'hrsh7th/cmp-buffer', after = "nvim-cmp" } -- buffer completions
  use { 'hrsh7th/cmp-path', after = "nvim-cmp" } -- path completions
  use { 'hrsh7th/cmp-nvim-lsp', after = "nvim-cmp" } -- cmd for lsp

  -- snippet engine
  use { 'L3MON4D3/LuaSnip', wants = "friendly-snippets" }
	use { 'rafamadriz/friendly-snippets', opt = true } -- useful snippets

  -- lsp config
  use 'neovim/nvim-lspconfig' -- lsp enabled
  use 'williamboman/mason.nvim' -- simple to use language server installer
  use { 'williamboman/mason-lspconfig.nvim', after = { "mason.nvim", "nvim-lspconfig" } } -- config for mason
  use 'onsails/lspkind.nvim' -- vs-code like icons for autocompletion
  use 'stevearc/aerial.nvim'

  -- formating and linting
  use 'jose-elias-alvarez/null-ls.nvim' -- for formatters and linters
	use {'jayp0521/mason-null-ls.nvim', after = { "mason.nvim", "null-ls.nvim" }} -- bridges gap b/w mason & null-ls

  -- commenting with gc
  use 'numToStr/Comment.nvim'
  use { 'JoosepAlviste/nvim-ts-context-commentstring', after = "nvim-treesitter" }

  -- treesitter syntax highlighting
  use 'nvim-treesitter/nvim-treesitter'
  
  -- utils
  use { 'windwp/nvim-autopairs', after = 'nvim-treesitter', }
  use { 'windwp/nvim-ts-autotag', after = 'nvim-treesitter' } -- autoclose tags
  use 'NvChad/nvim-colorizer.lua'
  use "famiu/bufdelete.nvim"
  use 'lewis6991/impatient.nvim'
  use 'max397574/better-escape.nvim'
  use 'lukas-reineke/indent-blankline.nvim'

  use "stevearc/dressing.nvim" 


  use "Shatur/neovim-session-manager"

  use { 'goolord/alpha-nvim', requires = { 'kyazdani42/nvim-web-devicons' } }
  --use { 'folke/trouble.nvim', requires = "kyazdani42/nvim-web-devicons" }

  -- terminal
  use 'akinsho/toggleterm.nvim'

	-- git integration
	use 'lewis6991/gitsigns.nvim' -- show line modifications on left hand side
  --use 'dinhhuy258/git.nvim'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require('packer').sync()
  end
end)
