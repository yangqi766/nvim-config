local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

local formatting = null_ls.builtins.formatting

local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
	debug = false,
	sources = {
		formatting.prettier.with({ -- 比默认少了 markdown
			filetypes = {
				"javascript",
				"javascriptreact",
				"typescript",
				"typescriptreact",
				"vue",
				"css",
				"scss",
				"less",
				"html",
				"json",
				"yaml",
				"graphql",
			},
			prefer_local = "node_modules/.bin",
		}),
		formatting.black.with({ extra_args = { "--fast", "--line-length=100", "-S" } }),
		formatting.stylua,
		formatting.golines,
		diagnostics.eslint_d.with({
			prefer_local = "node_modules/.bin",
		}),
		diagnostics.flake8.with({
			extra_args = { "--max-line-length=150", "--inline-quotes=double,single" },
		}),
	},
	on_attach = function(client)
		vim.cmd([[ command! Format execute 'lua vim.lsp.buf.formatting()']])
		if client.resolved_capabilities.document_formatting then
			vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
		end
	end,
})

local no_really = {
	method = null_ls.methods.DIAGNOSTICS,
	filetypes = { "markdown", "text" },
	generator = {
		fn = function(params)
			diagnostics = {}
			-- sources have access to a params object
			-- containing info about the current file and editor state
			for i, line in ipairs(params.content) do
				local col, end_col = line:find("really")
				if col and end_col then
					-- null-ls fills in undefined positions
					-- and converts source diagnostics into the required format
					table.insert(diagnostics, {
						row = i,
						col = col,
						end_col = end_col,
						source = "no-really",
						message = "Don't use 'really!'",
						severity = 2,
					})
				end
			end
			return diagnostics
		end,
	},
}

null_ls.register(no_really)
