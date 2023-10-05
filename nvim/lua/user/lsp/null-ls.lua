local nullLsStatusOk, nullLs = pcall(require, "null-ls")
if not nullLsStatusOk then
	return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = nullLs.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = nullLs.builtins.diagnostics

local codeactions = nullLs.builtins.code_actions

local augroup = vim.api.nvim_create_augroup("MyNeovimLspFormatting", {})

nullLs.setup({
	debug = false,
	sources = {
		-- formatting.prettier.with({ extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } }),
		-- formatting.clang_format,
		formatting.google_java_format.with({ extra_args = { "--aosp" } }),
		formatting.prettier,
		formatting.black.with({ extra_args = { "--fast" } }),
		formatting.stylua,
		formatting.latexindent,

		diagnostics.flake8,
		diagnostics.markdownlint_cli2,
		-- diagnostics.checkstyle.with({ extra_args = { "-c", "/sun_checks.xml" } }),
		diagnostics.checkmake,
		diagnostics.chktex.with({
			-- Ignore the warnings with -n, show them as errors with -e
			extra_args = {
				"-n1", -- Command terminated with space
				"-n3", -- You should enclose the previous parenthesis with {}
				"-n8", -- Wrong length of dash may have been used
				"-n12", -- Interword spacing (\ ) should perhaps be used
				"-n13", -- Intersentense spacing ('\@') should perhaps be used
				"-n18", -- You should use either `` or '' as an alternative to "
				"-n22", -- Comment displayed
				"-n25", -- You might wish to put this between a pair of {}
				"-n26", -- You ought to remove spaces in front of punctuation
				"-n30", -- Multiple spaces detected in output
				"-n45", -- Use \[...\] instead of $...$
				"-e16", -- Mathmode still on at end of LaTeX file
			},
		}),

		codeactions.proselint,
	},

	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({ async = false })
				end,
			})
		end
	end,
})
