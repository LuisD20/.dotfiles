-- import mason safely
local mason_setup, mason = pcall(require, "mason")
if not mason_setup then
	return
end

-- import mason-lspconfig safely
local mason_lspconfig_setup, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_setup then
	return
end

-- import mason-null-ls plugin safely
local mason_null_ls_status, mason_null_ls = pcall(require, "mason-null-ls")
if not mason_null_ls_status then
	return
end

local languages = 
{
  "cssls",
  "html",
  "jsonls",
  "tsserver",
  "sumneko_lua",
}

local formatters = 
{
  "prettier",
  "stylua",
  "eslint_d",
}

mason.setup({
  ui = 
  {
    border = "rounded",
    icons = 
    {
      package_installed = "✓",
      package_uninstalled = "✗",
      package_pending = "⟳",
    },
  },
  log_level = vim.log.levels.INFO,
  max_concurrent_installers = 4,
})

mason_lspconfig.setup({
  ensure_installed = languages,
  automatic_installation = true,
})

mason_null_ls.setup({
	ensure_installed = formatters,
	automatic_installation = true,
})