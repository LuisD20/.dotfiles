-- import null-ls plugin safely
local zen_mode_setup, zen_mode = pcall(require, "zen-mode")
if not zen_mode_setup then
	return
end

zen_mode.setup({
  window = 
  {
    backdrop = 0.95, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
    width = 1, -- width of the Zen window
    height = 1, -- height of the Zen window
  },
  plugins = 
  {
    -- disable some global vim options (vim.o...)
    -- comment the lines to not apply the options
    options = 
    {
      enabled = true,
      ruler = false, -- disables the ruler text in the cmd line area
      showcmd = false, -- disables the command in the last line of the screen
    },
    twilight = { enabled = true }, -- enable to start Twilight when zen mode opens
    gitsigns = { enabled = true }, -- disables git signs
  },
  -- callback where you can add custom code when the Zen window opens
  on_open = function(win)
  end,
  -- callback where you can add custom code when the Zen window closes
  on_close = function()
  end,
})