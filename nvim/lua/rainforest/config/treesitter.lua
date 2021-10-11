local api = vim.api
local configs = require("nvim-treesitter.configs")
local parser_configs = require("nvim-treesitter.parsers").get_parser_configs()

parser_configs.norg = {
	install_info = {
		url = "https://github.com/nvim-neorg/tree-sitter-norg",
		files = { "src/parser.c", "src/scanner.cc" },
		branch = "main",
	},
}

configs.setup({
	ensure_installed = "maintained",
	highlight = {
		enable = true,
		disable = { "org" },
		additional_vim_regex_highlighting = { "org" },
	},
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "gnn",
			node_incremental = "grn",
			scope_incremental = "grc",
			node_decremental = "grm",
		},
	},
	indent = {
		enable = true,
	},
})

-- disable folding by default
api.nvim_exec(
	[[
	set nofoldenable
	set foldmethod=expr
	set foldexpr=nvim_treesitter#foldexpr()
]],
	true
)
