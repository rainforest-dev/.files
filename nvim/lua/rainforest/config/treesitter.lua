local api = vim.api
local configs = require'nvim-treesitter.configs'

configs.setup {
	ensure_installed = {'python', 'go', 'lua', 'bash', 'json', 'yaml'},
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

-- disable folding by default
api.nvim_exec([[
	set nofoldenable
	set foldmethod=expr
	set foldexpr=nvim_treesitter#foldexpr()
]], true)
