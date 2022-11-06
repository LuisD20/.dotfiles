-- import scrollbar safely
local scrollbar_setup, scrollbar = pcall(require, "scrollbar")
if not scrollbar_setup then
	return
end

-- import hlslens safely
local hlslens_setup, hlslens = pcall(require, "hlslens")
if not hlslens_setup then
	return
end

local colors = require("tokyonight.colors").setup()

scrollbar.setup({
  handle =
  {
    color = colors.bg_highlight,
  },
  marks =
  {
    Search = { color = colors.orange },
    Error = { color = colors.error },
    Warn = { color = colors.warning },
    Info = { color = colors.info },
    Hint = { color = colors.hint },
    Misc = { color = colors.purple },
  }
})

hlslens.setup({
  build_position_cb = function(plist, _, _, _)
    require("scrollbar.handlers.search").handler.show(plist.start_pos)
  end,
})

vim.cmd([[
   augroup scrollbar_search_hide
       autocmd!
       autocmd CmdlineLeave : lua require('scrollbar.handlers.search').handler.hide()
   augroup END
]])