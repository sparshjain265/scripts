-- This is like init.vim, we can source other files for modularity and maintainability

-- For basic options
require "user.options"
require "user.keymaps"
require "user.plugins"
require "user.colorscheme"
require "user.cmp"
require "user.lsp"
require "user.telescope"
require "user.treesitter"
require "user.autopairs"
require "user.comment"

-- TODO
-- let g:tagbar_scrolloff = 8
-- plugins
-- vim.opt.base16colorspace = 256          -- access colors present in 256 colorspace
