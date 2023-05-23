-- colors
-- make an augroup so that it is always triggered
vim.cmd[[
augroup MyNeovimColors
    autocmd!
    autocmd ColorScheme * highlight Pmenu ctermbg=darkblue ctermfg=white guibg=#272836 guifg=white 
    autocmd ColorScheme * highlight PmenuSel ctermbg=darkgrey ctermfg=darkblue guibg=#1c1d26 guifg=white  
    autocmd ColorScheme * highlight PmenuSbar ctermbg=darkblue guibg=#272836
    autocmd ColorScheme * highlight PmenuThumb ctermbg=darkgrey guibg=#1c1d26
    autocmd ColorScheme * highlight SignColumn ctermbg=NONE guibg=NONE
    autocmd ColorScheme * highlight GitSignsAdd ctermbg=NONE guibg=NONE ctermfg=Green guifg=Green cterm=bold gui=bold
    autocmd ColorScheme * highlight GitSignsAddNr ctermbg=NONE guibg=NONE ctermfg=Green guifg=Green cterm=bold gui=bold
    autocmd ColorScheme * highlight GitSignsAddLn ctermbg=NONE guibg=NONE ctermfg=Green guifg=Green cterm=bold gui=bold
    autocmd ColorScheme * highlight GitSignsChange ctermbg=NONE guibg=NONE ctermfg=Cyan guifg=Cyan cterm=bold gui=bold
    autocmd ColorScheme * highlight GitSignsChangeNr ctermbg=NONE guibg=NONE ctermfg=Cyan guifg=Cyan cterm=bold gui=bold
    autocmd ColorScheme * highlight GitSignsChangeLn ctermbg=NONE guibg=NONE ctermfg=Cyan guifg=Cyan cterm=bold gui=bold
    autocmd ColorScheme * highlight GitSignsDelete ctermbg=NONE guibg=NONE ctermfg=Red guifg=Red cterm=bold gui=bold
    autocmd ColorScheme * highlight GitSignsDeleteNr ctermbg=NONE guibg=NONE ctermfg=Red guifg=Red cterm=bold gui=bold
    autocmd ColorScheme * highlight GitSignsDeleteLn ctermbg=NONE guibg=NONE ctermfg=Red guifg=Red cterm=bold gui=bold
augroup END
]]
-- autocmd ColorScheme * highlight GitSigns* ctermbg=NONE guibg=NONE

-- load your colorscheme after the augroup using a protected call
local colorscheme = 'default'

local statusOk, _ = pcall(vim.cmd, 'colorscheme ' .. colorscheme)

if not statusOk then
    vim.notify('colorscheme ' .. colorscheme .. ' not found!')
    return
end
