local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end

local hide_in_width = function()
	return vim.fn.winwidth(0) > 80
end

local diagnostics = {
	"diagnostics",
	sources = { "nvim_diagnostic" },
	sections = { "error", "warn", "info", "hint" },
	symbols = {
		error = " ",
		warn = " ",
		info = " ", --[[ "" ]]
		--[[ " ", ]]
		hint = " ",
	},
	colored = true,
	update_in_insert = true,
	always_visible = true,
}

local diff = {
	"diff",
	symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
	colored = true,
	update_in_insert = true,
	always_visible = true,
	cond = hide_in_width,
}

local mode = {
	"mode",
	colored = true,
	-- fmt = function(str)
	-- 	return "-- " .. str .. " --"
	-- end,
}

local filetype = {
	"filetype",
	icons_enabled = true,
	-- icon = nil,
}

local branch = {
	"branch",
	icons_enabled = true,
	icon = "",
}

local location = {
	"location",
	padding = 0,
}

-- cool function for progress
local progress = function()
	local current_line = vim.fn.line(".")
	local total_lines = vim.fn.line("$")
	local chars = { "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
	local line_ratio = current_line / total_lines
	local index = math.ceil(line_ratio * #chars)
	return chars[index]
end

local spaces = function()
	return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
end

lualine.setup({
	options = {
		icons_enabled = true,
		theme = "auto",
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline" },
		always_divide_middle = true,
	},
	sections = {
		lualine_a = { mode },
		lualine_b = { branch, diagnostics },
		lualine_c = { "filename", "searchcount" },
		-- lualine_x = { "encoding", "fileformat", "filetype" },
		lualine_x = { diff, spaces, "encoding", filetype },
		lualine_y = { location, progress },
		lualine_z = {},
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = { branch, diagnostics },
		lualine_c = { "filename" },
		lualine_x = { diff, spaces, "encoding", filetype },
		lualine_y = { location, progress },
		lualine_z = {},
	},
	tabline = {},
	extensions = {},
})
