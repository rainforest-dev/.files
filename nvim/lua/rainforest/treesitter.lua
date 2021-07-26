local configs = require'nvim-treesitter.configs'

configs.setup {
	ensure_installed = { 'bash', 'cuda', 'lua', 'python', 'yaml' },
	highlight = {
		enable = true,
	}
}
