-- import null-ls plugin safely
local setup, null_ls = pcall(require, "null-ls")
if not setup then
	return
end



null_ls.setup({
  sources = 
	{
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.diagnostics.eslint
  },
})

