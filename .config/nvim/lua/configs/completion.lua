-- import lspkind safely
local lspkind_status, lspkind = pcall(require, "lspkind")
if not lspkind_status then
	return
end

-- import luasnip safely
local luasnip_status, luasnip = pcall(require, "luasnip")
if not luasnip_status then
	return
end

-- import cmp safely
local cmp_status, cmp = pcall(require, "cmp")
if not cmp_status then
	return
end



local border_opts =
  { border = "single", winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None" }

-- load vs-code like snippets from plugins (e.g. friendly-snippets)
require("luasnip/loaders/from_vscode").lazy_load()

vim.opt.completeopt = "menu,menuone,noselect"

cmp.setup({
  formatting = 
  {
    fields = { "kind", "abbr", "menu" },
    format = lspkind.cmp_format({
			maxwidth = 50,
			ellipsis_char = "...",
		}),
  },
	snippet = 
  {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	sources = cmp.config.sources({
		{ name = "nvim_lsp" }, -- lsp
		{ name = "luasnip" }, -- snippets
		{ name = "buffer" }, -- text within current buffer
		{ name = "path" }, -- file system paths
	}),
  window = {
    completion = cmp.config.window.bordered(border_opts),
    documentation = cmp.config.window.bordered(border_opts),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true
    }),
  }),
  experimental = 
  {
    ghost_text = true,
  },
})

vim.cmd [[
  set completeopt=menuone,noinsert,noselect
  highlight! default link CmpItemKind CmpItemMenuDefault
]]