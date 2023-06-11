-- This is like init.vim, we can source other files for modularity and maintainability

-- Load this first for faster load times
require("user.impatient")

-- For basic options
require("user.options")
require("user.keymaps")
require("user.plugins")
require("user.colorscheme")
require("user.cmp")
require("user.lsp")
require("user.telescope")
require("user.treesitter")
require("user.autopairs")
require("user.comment")
require("user.gitsigns")
require("user.nvim-tree")
require("user.bufferline")
require("user.lualine")
require("user.toggleterm")
require("user.project")
require("user.session")
require("user.indentline")
require("user.alpha")

-- TODO
-- let g:tagbar_scrolloff = 8
-- plugins
-- vim.opt.base16colorspace = 256          -- access colors present in 256 colorspace
