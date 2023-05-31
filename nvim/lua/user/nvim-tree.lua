local statusOk, nvimTree = pcall(require, 'nvim-tree')
if not statusOk then
    return
end

-- local configStatusOk, nvimTreeConfig = pcall(require, 'nvim-tree.config')
-- if not configStatusOk then
--     return
-- end

-- local treeCallback = nvimTreeConfig.nvim_tree_callback

nvimTree.setup {
    disable_netrw = true,
    hijack_netrw = true,
    -- open_on_setup = false,
    -- ignore_ft_on_setup = {
    --     "startify",
    --     "dashboard",
    --     "alpha",
    -- },
    -- auto_close = true,
    open_on_tab = false,
    hijack_cursor = false,
    update_cwd = true,
    hijack_directories = {
        enable = true,
        auto_open = true,
    },
    diagnostics = {
        enable = true,
        icons = {
            hint = "",
            info = "",
            warning = "",
            error = "",
        },
    },
    update_focused_file = {
        enable = true,
        update_cwd = true,
        ignore_list = {},
    },
    git = {
        enable = true,
        ignore = false,
        timeout = 500,
    },
    view = {
        width = 30,
        -- height = 30,
        hide_root_folder = false,
        side = "left",
        -- auto_resize = true,
        mappings = {
            custom_only = false,
            -- list = {
            --     { key = { "l", "<CR>", "o" }, cb = treeCallback "edit" },
            --     { key = "h", cb = treeCallback "close_node" },
            --     { key = "v", cb = treeCallback "vsplit" },
            -- },
        },
        number = false,
        relativenumber = false,
    },
    actions = {
        -- quit_on_open = true,
        -- window_picker = { enable = true },
        open_file = {
            quit_on_open = true,
        },
    },
    renderer = {
        highlight_git = true,
        root_folder_modifier = ":t",
        icons = {
            show = {
                file = true,
                folder = true,
                folder_arrow = true,
                git = true,
            },
            glyphs = {
                default = "",
                symlink = "",
                git = {
                    unstaged = "",
                    staged = "S",
                    unmerged = "",
                    renamed = "➜",
                    deleted = "",
                    untracked = "U",
                    ignored = "◌",
                },
                folder = {
                    default = "",
                    open = "",
                    empty = "",
                    empty_open = "",
                    symlink = "",
                },
            }
        }
    }
}
