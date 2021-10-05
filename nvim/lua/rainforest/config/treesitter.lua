local api = vim.api
local configs = require'nvim-treesitter.configs'

configs.setup {
	ensure_installed = 'maintained',
	highlight = {
		enable = true,
	},
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = 'gnn',
			node_incremental = 'grn',
			scope_incremental = 'grc',
			node_decremental = 'grm'
		}
	},
	indent = {
		enable = true
	},
}

api.nvim_exec([[
	set foldmethod=expr
	set foldexpr=nvim_treesitter#foldexpr()
]], true)
