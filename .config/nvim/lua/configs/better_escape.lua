-- import better_escape safely
local better_escape_setup, better_escape = pcall(require, "better_escape")
if not better_escape_setup then
	return
end

better_escape.setup()