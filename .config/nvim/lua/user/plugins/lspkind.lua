-- import lspkind safely
local lspkind_status, lspkind = pcall(require, "lspkind")
if not lspkind_status then
	return
end

lspsymbols = {
  symbol_map = {
    NONE = "",
    Array = "",
    Boolean = "⊨",
    Class = "",
    Constructor = "",
    Key = "",
    Namespace = "",
    Null = "NULL",
    Number = "#",
    Object = "⦿",
    Package = "",
    Property = "",
    Reference = "",
    Snippet = "",
    String = "𝓐",
    TypeParameter = "",
    Unit = "",
  },
}

lspkind.init(lspsymbols)