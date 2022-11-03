# Luis's dotfiles

**Warning**: Don’t blindly use my settings unless you know what that entails. Use at your own risk!

## PowerShell setup (Windows)

- [Nerd fonts](https://github.com/ryanoasis/nerd-fonts) - Powerline-patched fonts. I use Hack.
- [Scoop](https://scoop.sh/) - A command-line installer
- [Oh My Posh](https://ohmyposh.dev/) - Prompt theme engine
- [Terminal Icons](https://github.com/devblackops/Terminal-Icons) - Folder and file icons
- [PSReadLine](https://docs.microsoft.com/en-us/powershell/module/psreadline/) - Cmdlets for customizing the editing environment, used for autocompletion
- [z](https://www.powershellgallery.com/packages/z) - Directory jumper
- [PSFzf](https://github.com/kelleyma49/PSFzf) - Fuzzy finder

## Arch linux setup

- [Arch linux](https://archlinux.org) - A simple, lightweight distribution
- [GRUB](https://wiki.archlinux.org/title/GRUB#UEFI_systems) - Grub is a boot loader
- [Xorg](https://wiki.archlinux.org/title/Xorg) - Display server
- [Xinit](https://wiki.archlinux.org/title/xinit) - Start window managers
- [Firefox](https://wiki.archlinux.org/title/firefox) - Web browser
- [AwesomeWM](https://wiki.archlinux.org/title/awesome) - Tiling window manager
- [Picom](https://wiki.archlinux.org/title/picom) - Standalone compositor for Xorg
- [Alacritty](https://wiki.archlinux.org/title/Alacritty) - Terminal
- [Nitrogen](https://wiki.archlinux.org/title/nitrogen)- Desktop wallpaper

Create in the home directory a file named .xinittrc

```
cp /etc/X11/xinitxinitrc /home/{username}/.xinitrc

vim .xinitrc
```

Add these in the last lines, and delete end lines

```
nitrogen --restore &
picom &
exec awesome
```

## Neovim setup

Requires [Neovim](https://neovim.io/) (>= 0.8)

- [Packer](https://github.com/wbthomason/packer.nvim)- Package management
- [Pleanry](https://github.com/nvim-lua/plenary.nvim) - Lua functions
- [Popup](https://github.com/nvim-lua/popup.nvim) - Popup API from vim
- [Colorscheme](https://github.com/cocopon/iceberg.vim/) - Dark blue color scheme
- [Completions](https://github.com/hrsh7th/nvim-cmp) - Completion pluging
- [Completions buffer](https://github.com/hrsh7th/cmp-buffer)- Completion for buffers
- [Completions paths](https://github.com/hrsh7th/cmp-path) - Completions for paths
- [Completions cmd](https://github.com/hrsh7th/cmp-cmdline) - Completions for cmd
- [Completions snippet](https://github.com/saadparwaiz1/cmp_luasnip) - Completions for snippets
- [Snipet engine](https://github.com/L3MON4D3/LuaSnip) - Snippets for neovim
- [LSP](https://github.com/neovim/nvim-lspconfig)- LSP completions for languages
- [LSP installer](https://github.com/williamboman/mason.nvim) - LSP manson installer
- [LSP installer config](https://github.com/williamboman/mason-lspconfig.nvim)- LSP manson config
- [LSP null](https://github.com/jose-elias-alvarez/null-ls.nvim) -- For formatters and linters
- [LSP highlighting](https://github.com/RRethy/vim-illuminate) -- LSP highlighting
- [LSP saga](https://github.com/glepnir/lspsaga.nvim) -- LSP saga


- [File browser](https://github.com/nvim-tree/nvim-tree.lua) - File browser
- [Icons](https://github.com/ryanoasis/vim-devicons) -- Icons
- [Status line](https://github.com/nvim-lualine/lualine.nvim) - Status line
- [Vim-surround](https://github.com/tpope/vim-surround) - Surroundings
- [Comment](https://github.com/numToStr/Comment.nvim) - Comments in neovim
- [Syntax highlighting](https://github.com/nvim-treesitter/nvim-treesitter) - Syntax highlighting
- [Telescope](https://github.com/nvim-telescope/telescope.nvim) - Fuzzy finder
- [Telescope fzf](https://github.com/nvim-telescope/telescope-fzf-native.nvim) - Telescope fzf

