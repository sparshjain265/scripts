vim.cmd [[packadd packer.nvim]]

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

end)
