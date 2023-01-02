-- Load gitsigns with a protected call
local status_ok, gitsigns = pcall(require, "gitsigns")
if not status_ok then
  return
end

-- Gitsigns options
gitsigns.setup({
  signs = 
  {
    add = { text = "▎" },
    change = { text = "▎" },
    delete = { text = "▎" },
    topdelete = { text = "契" },
    changedelete = { text = "▎" },
  },
})