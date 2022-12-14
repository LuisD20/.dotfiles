local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
  return
end

local icons = require "core.icons"

local close_func = function(bufnum)
  local bufdelete_avail, bufdelete = pcall(require, "bufdelete")
  if bufdelete_avail then
    bufdelete.bufdelete(bufnum, true)
  else
    vim.cmd["bdelete!"] { args = { bufnum } }
  end
end

bufferline.setup({
  options = 
  {
    offsets = 
    {
      { filetype = "NvimTree", text = "", padding = 1 },
      { filetype = "neo-tree", text = "", padding = 1 },
      { filetype = "Outline", text = "", padding = 1 }
    },
    buffer_close_icon = icons.BufferClose,
    modified_icon = icons.FileModified,
    close_icon = icons.NeovimClose,
    close_command = close_func,
    right_mouse_command = close_func,
    diagnostics = 'nvim_lsp',
    max_name_length = 14,
    max_prefix_length = 13,
    tab_size = 20,
    separator_style = "thin"
  }
})