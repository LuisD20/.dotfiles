-- Blinking Cursor
vim.cmd [[
		:set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
		  \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
		  \,sm:block-blinkwait175-blinkoff150-blinkon175
]]

-- Automatically deletes all trailing whitespace and newlines at end of file on save. & reset cursor position
vim.api.nvim_exec([[
autocmd BufWritePre * let currPos = getpos(".")
autocmd BufWritePre * %s/\s\+$//e
autocmd BufWritePre * %s/\n\+\%$//e
autocmd BufWritePre *.[ch] %s/\%$/\r/e
autocmd BufWritePre * cal cursor(currPos[1], currPos[2])
]], false)

-- Abbreviations
vim.cmd([[
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev 1! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall
]])

-- Disable Auto Commenting
vim.cmd [[au BufEnter * set fo-=c fo-=r fo-=o]]

-- Speed Things Up
vim.cmd [[silent! set updatetime=300 timeout timeoutlen=500 ttimeout ttimeoutlen=50 ttyfast lazyredraw]]

-- Disbale Word And Line Count
vim.api.nvim_exec([[ autocmd VimEnter * set noru]], false)

-- Disable Background Color Of The Cursorline
vim.cmd [[hi CursorLine cterm=underline term=underline ctermbg=NONE guibg=NONE]]

-- Remove These ~ ~ ~
vim.opt.fillchars:append { eob = " " }