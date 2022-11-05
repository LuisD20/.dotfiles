local opt = vim.opt

-- general settings
opt.number = true                           -- set numbered lines
opt.clipboard = "unnamedplus"               -- allows neovim to access the system clipboard
opt.showmode = false                        -- we don't need to see things like -- INSERT -- anymore
opt.completeopt = { "menuone", "noselect" } -- mostly just for cmp
opt.conceallevel = 0                        -- so that `` is visible in markdown files
opt.encoding = "UTF-8"                      -- the encoding written to a file
opt.mouse = "a"                             -- allow the mouse to be used in neovim
opt.updatetime = 300                        -- faster completion (4000ms default)              
opt.timeoutlen = 1000                       -- time to wait for a mapped sequence to complete (in milliseconds)
opt.hlsearch = true                         -- highlight all matches on previous search pattern
opt.guifont="Hack Nerd Font"

-- files
opt.undofile = true                         -- enable persistent undo                
opt.swapfile = false                        -- creates a swapfile

-- backups
opt.backup = false                          -- creates a backup file
opt.writebackup = false                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited

-- backspace
opt.backspace = "indent,eol,start"          -- allow backspace on indent, end of line or insert mode start position

-- tabs & indentation
opt.tabstop = 2                             -- insert 2 spaces for a tab
opt.shiftwidth = 2                          -- the number of spaces inserted for each indentation
opt.showtabline = 2                         -- always show tabs
opt.expandtab = true                        -- convert tabs to spaces
opt.autoindent = true                       -- autoidentation
opt.smartindent = true                      -- make indenting smarter again

-- line wrapping
opt.wrap = false                             -- display lines as one long line

-- search setting 
opt.ignorecase = true                        -- ignore case in search patterns
opt.smartcase = true                         -- smart case

-- cursor 
opt.cursorline = true                         -- highlight the current line

-- appearance
opt.termguicolors = true                      -- set term gui colors (most terminals support this)
opt.background = "dark"                       -- set the color of the background
opt.signcolumn = "yes"                        -- always show the sign column, otherwise it would shift the text each time

-- splt windows
opt.splitright = true                         -- force all vertical splits to go to the right of current window
opt.splitbelow = true                         -- force all horizontal splits to go below current window

opt.iskeyword:append("-")
