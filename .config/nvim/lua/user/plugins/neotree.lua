
local status_ok, neotree = pcall(require, "neo-tree")
if not status_ok then
  return
end

local icons = require "user.core.icons"

neotree.setup({
  close_if_last_window = true,
  enable_diagnostics = false,
  source_selector = {
    winbar = true,
    content_layout = "center",
    tab_labels = {
      filesystem = icons.FolderClosed .. " File",
      buffers = icons.DefaultFile .. " Bufs",
      git_status = icons.Git .. " Git",
      diagnostics = icons.Diagnostic .. " Diagnostic",
    },
  },
  default_component_configs = {
    indent = {
      padding = 0,
    },
    icon = {
      folder_closed = icons.FolderClosed,
      folder_open = icons.FolderOpen,
      folder_empty = icons.FolderEmpty,
      default = icons.DefaultFile,
    },
    git_status = {
      symbols = {
        added = icons.GitAdd,
        deleted = icons.GitDelete,
        modified = icons.GitChange,
        renamed = icons.GitRenamed,
        untracked = icons.GitUntracked,
        ignored = icons.GitIgnored,
        unstaged = icons.GitUnstaged,
        staged = icons.GitStaged,
        conflict = icons.GitConflict,
      },
    },
  },
  window = {
    width = 30,
    mappings = {
      o = "open",
      H = "prev_source",
      L = "next_source",
      h = "toggle_hidden",
    },
  },
  filesystem = {
    follow_current_file = true,
    hijack_netrw_behavior = "open_current",
    use_libuv_file_watcher = true,
  },
  event_handlers = {
    { event = "neo_tree_buffer_enter", handler = function(_) vim.opt_local.signcolumn = "auto" end },
  },
})