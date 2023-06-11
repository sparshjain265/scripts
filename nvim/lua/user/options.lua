-- :help options for generic help
-- :help 'option' for help on that particular option

-- avoid vim.opt all the time
-- define options locally first
local options = {
	compatible = false, -- disable compatibility to old time vi
	swapfile = false, -- disable swapfile, causes problems

	showmatch = true, -- show matching parenthesis
	ignorecase = true, -- case insensitive search
	smartcase = true, -- case sensitive if at least one capital letter
	mouse = "a", -- enable mouse
	hlsearch = true, -- highlight search
	incsearch = true, -- incremental search

	smarttab = true, -- tab also uses shiftwidth
	tabstop = 4, -- tabsize
	softtabstop = 4, -- soft tab stop
	expandtab = true, -- use spaces for tabs
	shiftwidth = 4, -- width for indentation purposes
	autoindent = true, -- set new line in the same indentation as the previous line
	smartindent = true, -- smart indentation for programming
	number = true, -- show line numbers
	relativenumber = true, -- show relative line numbers

	-- access to system clipboards
	clipboard = { "unnamed", "unnamedplus" },

	hidden = true,

	cursorline = true, -- highlight cursor line
	cursorlineopt = "number", -- highlight only the line number of the cursorline
	ttyfast = true, -- speed up scrolling

	-- sane way of splitting panes
	splitright = true,
	splitbelow = true,

	-- set scrolloff to show the set number of lines/characters for context
	scrolloff = 8,
	sidescrolloff = 8,

	termguicolors = true, -- brighter colors if terminal supports

	-- undofile = true                 -- persistent undo

	timeoutlen = 500, -- time to wait for a mapped sequence to complete (in milliseconds)
	updatetime = 300, -- faster completion (4000ms by default)

	signcolumn = "yes", -- always show the sign column to avoid shifting the text every now and then
}

for key, value in pairs(options) do
	vim.opt[key] = value
end

-- detect filetype, detect corresponding plugins and intendation
vim.cmd("filetype plugin indent on")
-- enable syntax highlighting
vim.cmd("syntax on")

-- allow arrow keys to wrap over first/last characters of the line to move to previous/next lines
vim.cmd("set whichwrap+=<,>,[,]")

-- save global variables in sessions
vim.cmd("set sessionoptions+=globals")
