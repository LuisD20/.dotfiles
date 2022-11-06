-- import dressing plugin safely
local dressing_status, dressing = pcall(require, "dressing")
if not dressing_status then
	return
end

dressing.setup({
  input = {
    default_prompt = "➤ ",
    winhighlight = "Normal:Normal,NormalNC:Normal",
  },
  select = {
    backend = { "telescope", "builtin" },
    builtin = { winhighlight = "Normal:Normal,NormalNC:Normal" },
  },
})