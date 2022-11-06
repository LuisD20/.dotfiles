local status, luasnip = pcall(require, "luasnip")

if not setup then
  return
end

luasnip.config.set_config {
  history = false,
  updateevents = "TextChanged,TextChangedI",
}

luasnip.snippets = {
  html = {}
}

luasnip.filetype_extend("javascriptreact", { "html" })
luasnip.filetype_extend("typescriptreact", { "html" })
luasnip.snippets.javascript = luasnip.snippets.html
luasnip.snippets.javascriptreact = luasnip.snippets.html
luasnip.snippets.typescriptreact = luasnip.snippets.html

require("luasnip.loaders.from_vscode").load({include = {"html"}})
require("luasnip.loaders.from_vscode").lazy_load()