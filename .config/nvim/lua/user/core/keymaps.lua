local opts = { noremap = true, silent = true }
local term_opts = { silent = true }
local keymap = vim.api.nvim_set_keymap

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

keymap('n', 'x', '"_x', opts) 

-- Modes
--   normal_mode = 'n',
--   insert_mode = 'i',
--   visual_mode = 'v',
--   visual_block_mode = 'x',
--   term_mode = 't',
--   command_mode = 'c',

-- Normal --
-- Better window navigation
keymap('n', 's<ledft>', '<C-w>h', opts)      -- move rigth
keymap('n', 's<up>', '<C-w>k', opts)      -- move left
keymap('n', 's<down>', '<C-w>j', opts)      -- move down
keymap('n', 's<right>', '<C-w>l', opts)      -- move up
keymap('n', 'sh', '<C-w>h', opts)
keymap('n', 'sk', '<C-w>k', opts)
keymap('n', 'sj', '<C-w>j', opts)
keymap('n', 'sl', '<C-w>l', opts)

-- resize with arrows
keymap('n', '<C-Up>', ':resize +2<CR>', opts)
keymap('n', '<C-Down>', ':resize -2<CR>', opts)
keymap('n', '<C-Left>', ':vertical resize -2<CR>', opts)
keymap('n', '<C-Right>', ':vertical resize +2<CR>', opts)

-- split window
keymap('n', 'ss', ':vsplit<Return><C-w>W', opts)
keymap('n', 'sv', ':split<Return><C-w>W', opts)

-- navigate buffers
keymap('n', '<S-d>', ':bnext<CR>', opts)
keymap('n', '<S-a>', ':bprevious<CR>', opts)

-- select all
keymap('n', '<C-a>', 'gg<S-v>G', opts)

-- nvim-tree
keymap('n', '<leader>e', '<CMD>NeoTreeShowToggle<CR>', opts)

-- telescope
keymap('n', 'ff', '<CMD>Telescope find_files<CR>', opts)
keymap('n', 'fs', '<CMD>Telescope live_grep<CR>', opts)
keymap('n', 'fc', '<CMD>Telescope grep_string<CR>', opts)
keymap('n', 'fb', '<CMD>Telescope buffers<CR>', opts)
keymap('n', 'fh', '<CMD>Telescope help_tags<CR>', opts)

-- telescope git commands (not on youtube nvim video)
keymap("n", "gc", "<cmd>Telescope git_commits<cr>", opts) -- list all git commits (use <cr> to checkout) ["gc" for git commits]
keymap("n", "gfc", "<cmd>Telescope git_bcommits<cr>", opts) -- list git commits for current file/buffer (use <cr> to checkout) ["gfc" for git file commits]
keymap("n", "gb", "<cmd>Telescope git_branches<cr>", opts) -- list git branches (use <cr> to checkout) ["gb" for git branch]
keymap("n", "gs", "<cmd>Telescope git_status<cr>", opts) -- list current changes per file with diff preview ["gs" for git status]

-- restart lsp server (not on youtube nvim video)
keymap("n", "rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary

-- save file
keymap("n", "<C-s>", "<CMD>:w<CR>", opts)

-- Insert --
-- save file
keymap("i", "<C-s>", "<CMD>:w<CR>", opts)

-- Visual --
-- Move text up and down
keymap('v', '<A-j>', ':m .+1<CR>==', opts)
keymap('v', '<A-k>', ':m .-2<CR>==', opts)
keymap('v', 'p', "''_dP'", opts)

-- Visual Block --
-- Move text up and down
keymap('x', 'J', "':move '>+1<CR>gv-gv'", opts)
keymap('x', 'K', "':move '<-2<CR>gv-gv'", opts)
keymap('x', '<A-j>', "':move '>+1<CR>gv-gv'", opts)
keymap('x', '<A-k>', "':move '<-2<CR>gv-gv'", opts)

-- Terminal --
-- Better terminal navigation
keymap('t', '<C-h>', '<C-\\><C-N><C-w>h', term_opts)
keymap('t', '<C-j>', '<C-\\><C-N><C-w>j', term_opts)
keymap('t', '<C-k>', '<C-\\><C-N><C-w>k', term_opts)
keymap('t', '<C-l>', '<C-\\><C-N><C-w>l', term_opts)






keymap("n", "<C-p>", "<cmd>Telescope projects<cr>", opts)