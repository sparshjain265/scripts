local statusOk, _ = pcall(require, "lspconfig")
if not statusOk then
	return
end

require("user.lsp.mason")
require("user.lsp.handlers").setup()
require("user.lsp.null-ls")
require("user.lsp.jdtls")
