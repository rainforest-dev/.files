local vim = vim
local utils = require'rainforest.utils'

vim.g.mapleader = ' '

local setup_mappings = function()
	-- Telescope
	utils.key_mapper{
		mode = 'n', 
		key = '<leader>ff', 
		cmd = ':lua require"telescope.builtin".find_files()<CR>', 
		category = 'Telescope', 
		unique_identifier = 'telescope_builtin_find_files', 
		description = 'Lists files in your current working directory, respects .gitignore'
	}
	utils.key_mapper{
		mode = 'n', 
		key = '<leader>fg', 
		cmd = ':lua require"telescope.builtin".live_grep()<CR>',
		category = 'Telescope',
		unique_identifier = 'telescope_builtin_live_grep',
		description = 'Search for a string in your current working directory and get results live as you type (respecting .gitignore)'
	}
	utils.key_mapper{
		mode = 'n', 
		key = '<leader>fb', 
		cmd = ':lua require"telescope.builtin".buffers()<CR>',
		category = 'Telescope',
		unique_identifier = 'telescope_builtin_buffers',
		description = 'Lists open buffers in current neovim instance'
	}
	utils.key_mapper{
		mode = 'n', 
		key = '<leader>fn', 
		cmd = ':lua require"telescope.builtin".help_tags()<CR>',
		category = 'Telescope',
		unique_identifier = 'telescope_builtin_help_tags',
		description = 'Lists available help tags and opens a new window with the relevant help info on <cr>'
	}
	utils.key_mapper{
		mode = 'n', 
		key = '<leader>tp', 
		cmd = ':lua require"telescope".extensions.packer.plugins(opts)<CR>',
		category = 'Telescope',
		unique_identifier = 'telescope_extensions_packer',
		description = ''
	}
	
	utils.key_mapper{
		mode = 'n', 
		key = '<leader>km', 
		cmd = ':Telescope mapper<CR>',
		category = 'Telescope',
		unique_identifier = 'telescope_key_mapping',
		description = 'Show key mapping'
	}
	utils.key_mapper{
		mode = 'n', 
		key = '<leader>co', 
		cmd = ':lua require"telescope.builtin".colorscheme()<CR>',
		category = 'Telescope',
		unique_identifier = 'telescope_builtin_colorscheme',
		description = 'Lists available colorschemes and applies them on <cr>'
	}
	utils.key_mapper{
		mode = 'n', 
		key = '<leader>gs', 
		cmd = ':lua require"telescope.builtin".git_status()<CR>',
		category = 'Telescope',
		unique_identifier = 'telescope_builtin_git_status',
		description = 'Lists current changes per file with diff preview and add action. (Multi-selection still WIP)'
	}
	--- extensions
	----flutter-tools.nvim
	utils.key_mapper{
		mode = 'n', 
		key = '<F5>', 
		cmd = ':lua require"telescope".extensions.flutter.commands()<CR>',
		category = 'Telescope',
		unique_identifier = 'telescope_extensions_flutter_commands',
		description = ''
	}
	
	utils.key_mapper{
		mode = '', 
		key = '<leader><Right>', 
		cmd = '$',
		category = 'System',
		unique_identifier = 'right_end',
		description = ''
	}
	utils.key_mapper{
		mode = '', 
		key = '<leader><Left>', 
		cmd = '^',
		category = 'System',
		unique_identifier = 'left_end',
		description = ''
	}
	utils.key_mapper{
		mode = '', 
		key = '<leader><Up>', 
		cmd = 'H',
		category = 'System',
		unique_identifier = 'top_end',
		description = ''
	}
	utils.key_mapper{
		mode = '', 
		key = '<leader><Down>', 
		cmd = 'L',
		category = 'System',
		unique_identifier = 'bottom_end',
		description = ''
	}

	require 'rainforest.config.nerdtree'.setup_mapping()
	require 'rainforest.config.lspsaga'.setup_mapping()
	require 'rainforest.config.hop'.setup_mapping()
	require 'rainforest.config.tmux'.setup_mapping()
end

G = {}

G.setup_lsp_mappings = function(client, bufnr)
	-- LSP
	utils.key_mapper{
		mode = 'n', 
		key = '<leader>d', 
		cmd = ':lua require "telescope.builtin".lsp_workspace_diagnostics()<CR>', 
		options = {noremap = true, silent = true},
		category = 'LSP',
		unique_identifier = 'lsp_workspace_diagnostics',
		description = ''
	}
	utils.key_mapper{
		mode = 'n', 
		key = '<leader>D', 
		cmd = ':lua require "telescope.builtin".lsp_document_diagnostics()<CR>', 
		options = {noremap = true, silent = true},
		category = 'LSP',
		unique_identifier = 'lsp_document_diagnostics',
		description = ''
	}
	utils.key_mapper{
		mode = 'n', 
		key = '<leader>o', 
		cmd = ':lua require "telescope.builtin".lsp_document_symbols()<CR>', 
		options = {noremap = true, silent = true},
		category = 'LSP',
		unique_identifier = 'lsp_document_symbols',
		description = ''
	}
	utils.key_mapper{
		mode = 'n', 
		key = '<leader>w', 
		cmd = ':lua require "telescope.builtin".lsp_workspace_symbols()<CR>', 
		options = {noremap = true, silent = true},
		category = 'LSP',
		unique_identifier = 'lsp_workspace_symbols',
		description = ''
	}

	utils.key_mapper{
		mode = 'n', 
		key = '<leader>gd', 
		cmd = ':lua require "telescope.builtin".lsp_definitions()<CR>', 
		options = {noremap = true, silent = true},
		category = 'LSP',
		unique_identifier = 'lsp_definitions',
		description = ''
	}
	utils.key_mapper{
		mode = 'n', 
		key = '<leader>gD', 
		cmd = ':lua require "telescope.builtin".lsp_declarations()<CR>', 
		options = {noremap = true, silent = true},
		category = 'LSP',
		unique_identifier = 'lsp_declarations',
		description = ''
	}
	utils.key_mapper{
		mode = 'n', 
		key = '<leader>gi', 
		cmd = ':lua require "telescope.builtin".lsp_implementations()<CR>', 
		options = {noremap = true, silent = true},
		category = 'LSP',
		unique_identifier = 'lsp_implementations',
		description = ''
	}
	utils.key_mapper{
		mode = 'n', 
		key = '<leader>gt', 
		cmd = ':lua require "telescope.builtin".lsp_typedefs()<CR>', 
		options = {noremap = true, silent = true},
		category = 'LSP',
		unique_identifier = 'lsp_typedefs',
		description = ''
	}
	utils.key_mapper{
		mode = 'n', 
		key = '<leader>gr', 
		cmd = ':lua require "telescope.builtin".lsp_references()<CR>', 
		options = {noremap = true, silent = true},
		category = 'LSP',
		unique_identifier = 'lsp_references',
		description = ''
	}

	-- Set some keybinds conditional on server capabilities
	if client.resolved_capabilities.document_formatting then
		utils.key_mapper{
			mode = 'n', 
			key = 'ff', 
			cmd = '<cmd>lua vim.lsp.buf.formatting()<CR>',
			category = 'Formatter',
			unique_identifier = 'formatter_formatting',
			description = ''
		}
	elseif client.resolved_capabilities.document_range_formatting then
		utils.key_mapper{
			mode = 'n', 
			key = 'ff', 
			cmd = '<cmd>lua vim.lsp.buf_range_formatting()<CR>',
			category = 'Formatter',
			unique_identifier = 'formatter_range_formatting',
			description = ''
		}
	end
end

setup_mappings()

return G
