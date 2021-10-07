local vim = vim
local utils = require'rainforest.utils'

vim.g.mapleader = ' '

local setup_mappings = function()
	-- Telescope
	utils.key_mapper('n', '<leader>ff', ':lua require"telescope.builtin".find_files()<CR>')
	utils.key_mapper('n', '<leader>fg', ':lua require"telescope.builtin".live_grep()<CR>')
	utils.key_mapper('n', '<leader>fb', ':lua require"telescope.builtin".buffers()<CR>')
	utils.key_mapper('n', '<leader>fn', ':lua require"telescope.builtin".help_tags()<CR>')
	utils.key_mapper('n', '<leader>tp', ':lua require"telescope".extensions.packer.plugins(opts)<CR>')
	utils.key_mapper('n', '<leader>km', ':lua require"telescope.builtin".keymaps()<CR>')
	utils.key_mapper('n', '<leader>co', ':lua require"telescope.builtin".colorscheme()<CR>')
	utils.key_mapper('n', '<leader>gs', ':lua require"telescope.builtin".git_status()<CR>')
	--- extensions
	----flutter-tools.nvim
	utils.key_mapper('n', '<F5>', ':lua require"telescope".extensions.flutter.commands()<CR>')

	-- Nerdtree
	utils.key_mapper('n', '<leader>ne', ':NERDTreeToggle<CR>')
	
	utils.key_mapper('', '<leader><Right>', '$')
	utils.key_mapper('', '<leader><Left>', '^')
	utils.key_mapper('', '<leader><Up>', 'H')
	utils.key_mapper('', '<leader><Down>', 'L')

	require 'rainforest.config.lspsaga'.setup_mapping()
	require 'rainforest.config.hop'.setup_mapping()
end

G = {}

G.setup_lsp_mappings = function(client, bufnr)
	-- LSP
	utils.key_mapper('n', '<leader>d', ':lua require "telescope.builtin".lsp_workspace_diagnostics()<CR>', {noremap = true, silent = true})
	utils.key_mapper('n', '<leader>D', ':lua require "telescope.builtin".lsp_document_diagnostics()<CR>', {noremap = true, silent = true})
	utils.key_mapper('n', '<leader>o', ':lua require "telescope.builtin".lsp_document_symbols()<CR>', {noremap = true, silent = true})
	utils.key_mapper('n', '<leader>w', ':lua require "telescope.builtin".lsp_workspace_symbols()<CR>', {noremap = true, silent = true})

	utils.key_mapper('n', '<leader>gd', ':lua require "telescope.builtin".lsp_definitions()<CR>', {noremap = true, silent = true})
	utils.key_mapper('n', '<leader>gD', ':lua require "telescope.builtin".lsp_declarations()<CR>', {noremap = true, silent = true})
	utils.key_mapper('n', '<leader>gi', ':lua require "telescope.builtin".lsp_implementations()<CR>', {noremap = true, silent = true})
	utils.key_mapper('n', '<leader>gt', ':lua require "telescope.builtin".lsp_typedefs()<CR>', {noremap = true, silent = true})
	utils.key_mapper('n', '<leader>gr', ':lua require "telescope.builtin".lsp_references()<CR>', {noremap = true, silent = true})
	
	-- [hrsh7th/nvim-compe](https://github.com/hrsh7th/nvim-compe#vim-script-confi)
	utils.key_mapper('i', '<tab>', 'v:lua.tab_complete()', {expr = true})
	utils.key_mapper('s', '<tab>', 'v:lua.tab_complete()', {expr = true})
	utils.key_mapper('i', '<s-tab>', 'v:lua.s_tab_complete()', {expr = true})
	utils.key_mapper('s', '<s-tab>', 'v:lua.s_tab_complete()', {expr = true})

	-- Set some keybinds conditional on server capabilities
	if client.resolved_capabilities.document_formatting then
		utils.key_mapper('n', 'ff', '<cmd>lua vim.lsp.buf.formatting()<CR>')
	elseif client.resolved_capabilities.document_range_formatting then
		utils.key_mapper('n', 'ff', '<cmd>lua vim.lsp.buf_range_formatting()<CR>')
	end
end

setup_mappings()

return G
