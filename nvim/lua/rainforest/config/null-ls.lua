local null_ls = require("null-ls")

null_ls.config({
	debug = true,
	sources = {
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.yapf.with({
			args = { "--style", "{based_on_style: pep8, indent_width: 2, column_limit: 100}" },
		}),
		null_ls.builtins.code_actions.gitsignsi,
	},
})

require("lspconfig")["null-ls"].setup({})
