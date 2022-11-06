-- import treesitter safely
local treesitter_setup, treesitter = pcall(require, "nvim-treesitter.configs")
if not treesitter_setup then
	return
end

treesitter.setup({
  ensure_installed = 
  {
		"json",
		"javascript",
		"typescript",
		"tsx",
		"yaml",
		"html",
		"css",
		"markdown",
		"graphql",
		"lua",
		"vim",
		"dockerfile",
		"gitignore",
	},
  auto_install = true,
  highlight = 
  {
    enable = true,
    disable = {}
  },
  autotag = 
  { 
    enable = true 
  },
  indent = 
  { 
    enable = false,
    disable = {}
  },
  context_commentstring = 
  {
    enable = true,
    enable_autocmd = false,
    config = 
    {
      javascript = 
      {
        __default = '// %s',
        jsx_element = '{/* %s */}',
        jsx_fragment = '{/* %s */}',
        jsx_attribute = '// %s',
        comment = '// %s'
      }
    }
  }
})