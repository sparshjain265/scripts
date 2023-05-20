-- :help options for generic help
-- :help 'option' for help on that particular option

vim.opt.compatible = false              -- disable compatibility to old time vi

vim.opt.showmatch = true                -- show matching parenthesis
vim.opt.ignorecase = true               -- case insensitive search
vim.opt.smartcase = true                -- case sensitive if at least one capital letter
vim.opt.mouse = 'a'                     -- enable mouse
vim.opt.hlsearch = true                 -- highlight search
vim.opt.incsearch = true                -- incremental search

vim.opt.smarttab = true                 -- tab also uses shiftwidth
vim.opt.tabstop = 4                     -- tabsize
vim.opt.softtabstop = 4                 -- soft tab stop
vim.opt.expandtab = true                -- use spaces for tabs
vim.opt.shiftwidth = 4                  -- width for indentation purposes
vim.opt.autoindent = true               -- set new line in the same indentation as the previous line
vim.opt.smartindent = true              -- smart indentation for programming
vim.opt.number = true                   -- show line numbers
vim.opt.relativenumber = true           -- show relative line numbers

-- detect filetype, detect corresponding plugins and intendation
vim.cmd "filetype plugin indent on"
-- enable syntax highlighting
vim.cmd "syntax on"

-- access to system clipboards
vim.opt.clipboard = vim.opt.clipboard + { "unnamed", "unnamedplus" }

vim.opt.cursorline = true               -- highlight cursor line
vim.opt.cursorlineopt = 'number'        -- highlight only the line number of the cursorline
vim.opt.ttyfast = true                  -- speed up scrolling

-- sane way of splitting panes
vim.opt.splitright = true
vim.opt.splitbelow = true

-- set scrolloff to show the set number of lines/characters for context
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8

vim.opt.termguicolors = true            -- brighter colors if terminal supports

-- vim.opt.undofile = true                 -- persistent undo

vim.opt.timeoutlen = 1000               -- time to wait for a mapped sequence to complete (in milliseconds)
vim.opt.updatetime = 300                -- faster completion (4000ms by default)

vim.opt.signcolumn = 'yes'              -- always show the sign column to avoid shifting the text every now and then

-- allow arrow keys to wrap over first/last characters of the line to move to previous/next lines
vim.cmd "set whichwrap+=<,>,[,]"

-- colors
-- make an augropu so that it is always triggered
-- explicitly set the default colorscheme to trigger it at least once
vim.cmd[[
augroup MyNeovimColors
autocmd!
autocmd ColorScheme * highlight Pmenu ctermbg=darkblue ctermfg=white guibg=#272836 guifg=white 
autocmd ColorScheme * highlight PmenuSel ctermbg=darkgrey ctermfg=darkblue guibg=#1c1d26 guifg=white  
autocmd ColorScheme * highlight PmenuSbar ctermbg=darkblue guibg=#272836
autocmd ColorScheme * highlight PmenuThumb ctermbg=darkgrey guibg=#1c1d26
autocmd ColorScheme * highlight SignColumn ctermbg=NONE guibg=NONE
augroup END
colorscheme default
]]

