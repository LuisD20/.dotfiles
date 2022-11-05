-- import mason safely
local mason_setup, mason = pcall(require, "mason")
if not mason_setup then
	return
end

mason.setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_uninstalled = "✗",
      package_pending = "⟳",
    },
  },
})