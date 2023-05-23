vim.cmd [[packadd packer.nvim]]

-- Autocommand to reload neovim config when plugins.lua is saved
vim.cmd [[
    augroup MyNeovimPackerUserConfig
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup END
]]

-- use protected call
local statusOk, packer = pcall(require, 'packer')
if not statusOk then
    return
end

-- have packer use a popup window
packer.init {
    display = {
        open_fn = function ()
            return require('packer.util').float {}
        end
    }
}

return packer.startup(function (use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- You add plugins here
    -- These are lua based basic plugins required by many other plugins
    use 'nvim-lua/plenary.nvim'
    use 'nvim-lua/popup.nvim'

    -- Colorschemes
    use 'lunarvim/colorschemes'

    -- Autocomplete Plugins
    use 'hrsh7th/nvim-cmp'              -- The complete plugin
    use 'hrsh7th/cmp-buffer'            -- buffer completions
    use 'hrsh7th/cmp-path'              -- path completions
    use 'hrsh7th/cmp-cmdline'           -- cmdline completions
    use 'saadparwaiz1/cmp_luasnip'      -- snippet completions
    use 'hrsh7th/cmp-nvim-lsp'          -- LSP completions
    use 'hrsh7th/cmp-nvim-lua'

    -- snippets
    use 'L3MON4D3/LuaSnip'              -- snippet engine
    use 'rafamadriz/friendly-snippets'  -- a bunch of helpful snippets

    -- LSP
    use 'neovim/nvim-lspconfig'
    use 'williamboman/mason.nvim'               -- simple to use language server installer 
    use 'williamboman/mason-lspconfig.nvim'
    use 'jose-elias-alvarez/null-ls.nvim'       -- LSP diagnostics and code actions

    -- Telescope
    use 'nvim-telescope/telescope.nvim'
    use 'nvim-telescope/telescope-media-files.nvim'

    -- Tree Sitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
    }
    use 'p00f/nvim-ts-rainbow'
    use 'nvim-treesitter/playground'

    -- to show markdown preview
    -- use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, cmd = { "MarkdownPreview" } })
    -- use {"ellisonleao/glow.nvim", config = function() require("glow").setup() end}

    -- Lazy loading example - visit packer.nvim's github page for more
    -- This plugin it opt(ional) in the sense that it is only loaded on envokation of one of the cmd
    -- use {'tpope/vim-dispatch', opt = true, cmd = {'Dispatch', 'Make', 'Focus', 'Start'}}
end)
