local statusOk, comment = pcall(require, 'Comment')
if not statusOk then
    return
end

local tsContextStatusOk, tsContext = pcall(require, 'ts_context_commentstring.integrations.comment_nvim')
if not tsContextStatusOk then
    comment.setup()
end

comment.setup {
    pre_hook = tsContext.create_pre_hook(),
}

-- comment.setup {
--    pre_hook = function (ctx)
--        local U = require 'Comment.utils'

--        local location = nil
--        if ctx.ctype == U.ctype.block then
--            location = require('ts_context_commentstring.utils').get_cursor_location()
--        elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
--            location = require('ts_context_commentstring.utils').get_visual_start_location()
--        end

--        local contextStatusOk, context = pcall(require, 'ts_context_commentstring.internal')
--        if not contextStatusOk then
--            return
--        end
--        return context.calculate_commentstring {
--            key = ctx.ctype == U.ctype.line and '__default' or '__multiline',
--            location = location,
--        }
--    end,
--}
