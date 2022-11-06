-- Load telescope with a protected call
local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
   return
end

local icons = require "core.icons"
local actions = require "telescope.actions"
telescope.load_extension "media_files"
telescope.load_extension 'projects'

telescope.setup({
  defaults = 
  {
    prompt_prefix = string.format("%s ", icons.Telescope),
    selection_caret = string.format("%s ", icons.Selected),
    path_display = { "smart" },
    file_ignore_patterns = { ".git/", "node_modules" },
    mappings = 
    {
      i = {
        ["<A-q>"] = actions.close,
        ["<A-j>"] = actions.move_selection_next,
        ["<A-k>"] = actions.move_selection_previous,
        ["<A-u>"] = actions.preview_scrolling_up,
        ["<A-d>"] = actions.preview_scrolling_down,
        ["<C-v>"] = actions.select_vertical,
        ["<C-h>"] = actions.select_horizontal,
      },
    }
  },
  extensions = {
    media_files = {
      -- filetypes whitelist
      -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
      filetypes = {"png", "webp", "jpg", "jpeg"},
      find_cmd = "rg" -- find command (defaults to `fd`)
    }
  },
})