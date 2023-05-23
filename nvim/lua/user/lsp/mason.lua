local servers = {
    'pyright',
    'tsserver',
    'jsonls',
    'html',
    'lua_ls',
}

local settings = {
    ui = {
        border = 'none',
        icons = {
            package_installed = "◍",
			package_pending = "◍",
			package_uninstalled = "◍",
        },
    },
    log_level = vim.log.levels.INFO,
    max_concurrent_installers = 4,
}

require('mason').setup(settings)
require('mason-lspconfig').setup({
    ensure_installed = servers,
    automatic_installation = true,
})

local lspconfigStatusOk, lspconfig = pcall(require, 'lspconfig')
if not lspconfigStatusOk then
    return
end

local opts = {}

for _, server in pairs(servers) do
    opts = {
        on_attach = require('user.lsp.handlers').on_attach,
        capabilities = require('user.lsp.handlers').capabilities,
    }

    server = vim.split(server, '@')[1]

    local requireOk, confOpts = pcall(require, 'user.lsp.settings.' .. server)
    if requireOk then
        opts = vim.tbl_deep_extend('force', confOpts, opts)
    end

    lspconfig[server].setup(opts)
end
