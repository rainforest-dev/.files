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
	--- extensions
	----flutter-tools.nvim
	utils.key_mapper('n', '<F5>', ':lua require"telescope".extensions.flutter.commands()<CR>')

	-- LSP
	utils.key_mapper('n', 'gd', ':lua vim.lsp.buf.definition()<CR>')
	utils.key_mapper('n', 'gD', ':lua vim.lsp.buf.declaration()<CR>')
	utils.key_mapper('n', 'gi', ':lua vim.lsp.buf.implementation()<CR>')
	utils.key_mapper('n', 'gw', ':lua vim.lsp.buf.document_symbol()<CR>')
	utils.key_mapper('n', 'gW', ':lua vim.lsp.buf.workspace_symbol()<CR>')
	utils.key_mapper('n', 'gr', ':lua vim.lsp.buf.references()<CR>')
	utils.key_mapper('n', 'gt', ':lua vim.lsp.buf.type_definition()<CR>')
	utils.key_mapper('n', 'K', ':lua vim.lsp.buf.hover()<CR>')
	utils.key_mapper('n', '<c-k>', ':lua vim.lsp.buf.signature_help()<CR>')
	utils.key_mapper('n', '<leader>af', ':lua vim.lsp.buf.code_action()<CR>')
	utils.key_mapper('n', '<leader>rn', ':lua vim.lsp.buf.rename()<CR>')
	
	-- [nvim-lua/completion-nvim](https://github.com/nvim-lua/completion-nvim)
	utils.key_mapper('i', '<tab>', '<Plug>(completion_smart_tab)', false)
	utils.key_mapper('i', '<s-tab>', '<Plug>(completion_smart_s_tab)', false)
	-- Nerdtree
	utils.key_mapper('n', '<leader>ne', ':NERDTreeToggle<CR>')
	
	utils.key_mapper('', '<leader><Right>', '$')
	utils.key_mapper('', '<leader><Left>', '^')
	utils.key_mapper('', '<leader><Up>', 'H')
	utils.key_mapper('', '<leader><Down>', 'L')
	
end

setup_mappings()
