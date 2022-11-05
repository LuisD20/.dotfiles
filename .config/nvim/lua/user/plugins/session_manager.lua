-- import session_manager safely
local session_manager_setup, session_manager = pcall(require, "session_manager")
if not session_manager_setup then
	return
end

session_manager.setup()