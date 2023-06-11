local statusOk, npairs = pcall(require, 'nvim-autopairs')
if not statusOk then
    return
end

npairs.setup {
    check_ts = true,
    ts_config = {
        -- lua = { 'string', 'source' },                                        -- it will not add a pair on that treesitter node
        -- javascript = { 'string', 'template_string' },                        -- same for javascript
        -- java = false,                                                        -- don't check treesitter on java
    },
    -- echo ft gives filetype
    disable_filetype = { 'TelescopePrompt', 'spectre_panel' },
    fast_wrap = {
        -- Keybinding to show where to put the closing pair
        map = '<A-p>',
        chars = { '(', '{', '[', '"', "'", },
        pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
        offset = 0,
        end_key = '$',
        keys = "qwertyuiopzxcvbnmasdfghjkl",
        check_comma = true,
        highlight = 'PmenuSel',
        highlight_grey = 'LineNr',
    },
}

local cmpAutopairsStatusOk, cmpAutopairs = pcall(require, 'nvim-autopairs.completion.cmp')
if not cmpAutopairsStatusOk then
    return
end

local cmpStatusOk, cmp = pcall(require, 'cmp')
if not cmpStatusOk then
    return
end

cmp.event:on('confirm_done', cmpAutopairs.on_confirm_done { map_char = { tex = '' } } )
