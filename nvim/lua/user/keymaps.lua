-- options for common keymaps 
local opts = { noremap = true, silent = true, nowait = true }

local wait_opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- shorten the function name
local keymap = vim.api.nvim_set_keymap

-- remap space as leader key
-- not really used right now but keeping for future reference
-- keymap("", "<Space>", "<Nop>", wait_opts)
-- vim.g.mapleader = " "
-- vim.g.maplocalleader = " "

-- Modes for mappings
-- normal mode = n
-- insert mode = i
-- visual mode = v
-- visual block mode = x
-- terminal mode = t
-- command mode = c

-- Stay in visual mode after shifting/indenting
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)
keymap("v", "=", "=gv", opts)

-- Move between buffers
keymap("n", "<F2>", ":bprevious<CR>", opts)
keymap("n", "<F3>", ":bnext<CR>", opts)
keymap("i", "<F2>", "<Esc>:bprevious<CR>a", opts)
keymap("i", "<F3>", "<Esc>:bnext<CR>a", opts)

-- Toggle built in file explorer
keymap("n", "<leader>e", ":Lexplore 15<CR>", opts)

-- Move between split panes
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("i", "<C-h>", "<Esc><C-w>ha", opts)
keymap("t", "<C-h>", "<C-\\><C-n><C-w>ha", opts)

keymap("n", "<C-j>", "<C-w>j", opts)
keymap("i", "<C-j>", "<Esc><C-w>ja", opts)
keymap("t", "<C-j>", "<C-\\><C-n><C-w>ja", opts)

keymap("n", "<C-k>", "<C-w>k", opts)
keymap("i", "<C-k>", "<Esc><C-w>ka", opts)
keymap("t", "<C-k>", "<C-\\><C-n><C-w>ka", opts)

keymap("n", "<C-l>", "<C-w>l", opts)
keymap("i", "<C-l>", "<Esc><C-w>la", opts)
keymap("t", "<C-l>", "<C-\\><C-n><C-w>la", opts)

keymap("n", "<C-left>", "<C-w>h", opts)
keymap("i", "<C-left>", "<Esc><C-w>ha", opts)
keymap("t", "<C-left>", "<C-\\><C-n><C-w>ha", opts)

keymap("n", "<C-down>", "<C-w>j", opts)
keymap("i", "<C-down>", "<Esc><C-w>ja", opts)
keymap("t", "<C-down>", "<C-\\><C-n><C-w>ja", opts)

keymap("n", "<C-up>", "<C-w>k", opts)
keymap("i", "<C-up>", "<Esc><C-w>ka", opts)
keymap("t", "<C-up>", "<C-\\><C-n><C-w>ka", opts)

keymap("n", "<C-right>", "<C-w>l", opts)
keymap("i", "<C-right>", "<Esc><C-w>la", opts)
keymap("t", "<C-right>", "<C-\\><C-n><C-w>la", opts)

-- move the split panes themselves
keymap("n", "<C-A-h>",  "<C-W>H", opts)
keymap("n", "<C-A-j>",  "<C-W>J", opts)
keymap("n", "<C-A-k>",  "<C-W>K", opts)
keymap("n", "<C-A-l>",  "<C-W>L", opts)

keymap("n", "<C-A-left>",  "<C-W>H", opts)
keymap("n", "<C-A-down>",  "<C-W>J", opts)
keymap("n", "<C-A-up>",  "<C-W>K", opts)
keymap("n", "<C-A-right>",  "<C-W>L", opts)

-- move line/selected block with Alt
keymap("n", "<A-j>", ":m .+1<CR>==", opts)
keymap("n", "<A-k>", ":m .-2<CR>==", opts)
keymap("n", "<A-down>", ":m .+1<CR>==", opts)
keymap("n", "<A-up>", ":m .-2<CR>==", opts)

keymap("i", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("i", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)
keymap("i", "<A-down>", "<Esc>:m .+1<CR>==gi", opts)
keymap("i", "<A-up>", "<Esc>:m .-2<CR>==gi", opts)

keymap("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)
keymap("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)
keymap("v", "<A-down>", ":m '>+1<CR>gv=gv", opts)
keymap("v", "<A-up>", ":m '<-2<CR>gv=gv", opts)

-- open terminal below from normal mode and enter in insert mode immediately
keymap("n", "<C-`>", ":split<CR><C-w>J:terminal<CR>i", opts)
-- Esc to exit terminal mode and enter normal mode
keymap("t", "<Esc>", "<C-\\><C-n>", opts)

-- Ctrl +/- to resize windows vertically
keymap("n", "<C-S-=>", "<C-w><C-+>", opts)
keymap("n", "<C-kPlus>", "<C-w><C-+>", opts)
keymap("n", "<C-->", "<C-w><C-->", opts)
keymap("n", "<C-kMinus>", "<C-w><C-->", opts)

-- Ctrl ,/. (looks like </> on keyboard) to resize windows horizontally
-- Ctrl * / (multiply divide on keypad) too
keymap("n", "<C-,>", "<C-w><C-<>", opts)
keymap("n", "<C-.>", "<C-w><C->>", opts)
keymap("n", "<C-kDivide>", "<C-w><C-<>", opts)
keymap("n", "<C-kMultiply>", "<C-w><C->>", opts)

-- Ctrl 0 to reset window sizes
keymap("n", "<C-0>", "<C-w><C-=>", opts)
keymap("n", "<C-k0>", "<C-w><C-=>", opts)

-- Retain the original clipboard when replacing something in visual mode
keymap("v", "p", '"_dP', opts)
