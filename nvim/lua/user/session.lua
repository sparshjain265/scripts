local statusOk, session_manager = pcall(require, "session_manager")
if not statusOk then
	return
end

local Autoload = require("session_manager.config").AutoloadMode
local mode = Autoload.CurrentDir

local projectStatusOk, project = pcall(require, "project_nvim.project")
if not projectStatusOk then
	return
end

local project_root, _ = project.get_project_root()
if project_root ~= nil then
	mode = Autoload.CurrentDir
end

session_manager.setup({
	autoload_mode = mode, -- Define what to do when Neovim is started without arguments.
	autosave_last_session = true, -- Automatically save last session on exit and on session switch.
	autosave_ignore_not_normal = false, -- keep it false
	autosave_ignore_dirs = {
		"~",
	},
	autosave_ignore_filetypes = { -- All buffers of these file types will be closed before the session is saved.
		"ccc-ui",
		"gitcommit",
		"qf",
	},
	autosave_only_in_session = true, -- Always autosaves session. If true, only autosaves after a session is active.
})
