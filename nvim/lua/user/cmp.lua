local cmp_status_ok, cmp = pcall(require, 'cmp')
if not cmp_status_ok then
    return
end

local snip_status_ok, luasnip = pcall(require, 'luasnip')
if not snip_status_ok then
    return
end

require('luasnip/loaders/from_vscode').lazy_load()

local check_backspace = function()
    local col = vim.fn.col '.' - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match '%s'
end

--   פּ ﯟ   some other good icons
local kind_icons = {
  Text = "󰚞", -- ""
  Method = "m",
  Function = "󰊕", -- ""
  Constructor = "", -- ""
  Field = "",
  Variable = "", -- ""
  Class = "", -- ""
  Interface = "",
  Module = "",
  Property = "",
  Unit = "",
  Value = "󰎠", -- ""
  Enum = "",
  Keyword = "󰌋", -- ""
  Snippet = "",
  Color = "", -- ""
  File = "", -- ""
  Reference = "",
  Folder = "󰉋",
  EnumMember = "",
  Constant = "", -- ""
  Struct = "",
  Event = "",
  Operator = "", -- ""
  TypeParameter = "󰊄", -- ""
}
-- find more here: https://www.nerdfonts.com/cheat-sheet

cmp.setup {
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)           -- for luasnip users
        end,
    },
    mapping = {
        -- Select prev/next item
        ['<Up>'] = cmp.mapping.select_prev_item(),
        ['<Down>'] = cmp.mapping.select_next_item(),

        -- Scoll the documentation of the selected item
        ['<S-Up>'] = cmp.mapping(cmp.mapping.scroll_docs(-1), {'i', 'c'}),
        ['<S-Down>'] = cmp.mapping(cmp.mapping.scroll_docs(1), {'i', 'c'}),

        -- Force completions when not shown
        ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), {'i', 'c'}),

        -- to remove default <C-y> mapping
        ['<C-y>'] = cmp.config.disable,

        -- to close the autocomplete menu
        ['<leader><Tab>'] = cmp.mapping {
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
        },

        -- Accept currently selected item
        -- Set select = true to confirm the first option by default
        -- Set select = false to only confirm explicitely selected items
        ['<CR>'] = cmp.mapping.confirm { select = true },
        -- Tab to cycle through autocomplete options
        -- Overload tab to jump through snippets
        ['<Tab>'] = cmp.mapping(function (fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expandable() then
                luasnip.expand()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            elseif check_backspace then
                fallback()
            else
                fallback()
            end
        end, {
            'i',
            's',
        }),
        -- Shift-Tab to cycle backwards in autocomplete options
        -- Overload to jump backwards in snippets
        ['<S-Tab>'] = cmp.mapping(function (fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, {
            'i',
            's',
        }),
    },
    formatting = {
        fields = { 'kind', 'abbr', 'menu' },
        format = function (entry, vim_item)
            -- Kind icons
            vim_item.kind = string.format('%s', kind_icons[vim_item.kind])

            -- If you want to concatenate the icons with the name of the item kind
            -- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind)
            vim_item.menu = ({
                nvim_lsp = '[LSP]',
                nvim_lua = '[NVIM_LUA]',
                luasnip = '[Snippet]',
                buffer = '[Buffer]',
                path = '[Path]',
            })[entry.source.name]
            return vim_item
        end,
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'nvim_lua' },
        { name = 'luasnip' },
        { name = 'buffer' },
        { name = 'path' },
    },
    confirm_opts = {
        behavior = cmp.ConfirmBehavior.Replace,
        select = false,
    },
    window = {
        documentation = cmp.config.window.bordered(),
    },
    experimental = {
        ghost_text = true,
        native_menu = false,
    },
}
