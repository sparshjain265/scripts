local statusOk, configs = pcall(require, 'nvim-treesitter.configs')
if not statusOk then
    return
end

configs.setup {
    ensure_installed = 'all',           -- one of 'all', 'maintained' (parsers with maintainers), or a list of languages
    sync_install = false,
    auto_install = true,
    ignore_install = { '' },            -- list of parsers to ignore installing
    autopairs = {
        enable = true,
    },
    context_commentstring = {
        enable = true,
        enable_autocmd = false,
    },
    highlight = {
        enable = true,                  -- false will disable the extension
        disable = { '' },               -- list of languages that will be disabled
        additional_vim_regex_highlighting = true,
    },
    indent = { enable = true, disable = {} },
    rainbow = {
        enable = true,
        -- disable = { 'jsx', 'cpp' },  -- list of languages you want to disable the plugin for
        extended_mode = true,           -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
        max_file_lines = nil            -- Do not enable for files with more than n lines, int
        -- colors = {}                  -- table of hex strings
        -- termcolors = {}              -- table of color name strings
    },
    playground = {
        enable = true,
        -- disable = {},
        -- updatetime = 25,                -- Debounced time for highlighting nodes in the playground from source code
        -- persist_queries = false,        -- Whether the query persists across vim sessions
        -- keybindings = {
        --    toggle_query_editor = 'o',
        --    toggle_hl_groups = 'i',
        --    toggle_injected_languages = 't',
        --    toggle_anonymous_nodes = 'a',
        --    toggle_language_display = 'I',
        --    focus_language = 'f',
        --    unfocus_language = 'F',
        --    update = 'R',
        --    goto_node = '<CR>',
        --    show_help = '?'
        -- }
    },
}

vim.cmd [[
    set foldmethod=expr
    set foldexpr=nvim_treesitter#foldexpr()
    set nofoldenable
]]
