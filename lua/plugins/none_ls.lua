return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		local sources = {
			null_ls.builtins.formatting.stylua,
			null_ls.builtins.formatting.shfmt,
			null_ls.builtins.formatting.gofumpt,
			null_ls.builtins.formatting.goimports,
			null_ls.builtins.formatting.sqlformat,
		}
		null_ls.setup({
			sources = sources,
			on_attach = function(current_client, bufnr)
				if current_client.supports_method("textDocument/formatting") then
					vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = augroup,
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format({
								filter = function(client)
									-- only use null-ls for formatting instead of lsp server
									return client.name == "null-ls"
								end,
								bufnr = bufnr,
							})
						end,
					})
				end
			end,
		})
	end,
}
