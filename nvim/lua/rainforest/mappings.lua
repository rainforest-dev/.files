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
	utils.key_mapper('n', 'gr', ':lua vim.lsp.buf.references()<CR>')
	utils.key_mapper('n', 'gt', ':lua vim.lsp.buf.type_definition()<CR>')
	utils.key_mapper('n', 'K', ':lua vim.lsp.buf.hover()<CR>')
	utils.key_mapper('n', '<c-k>', ':lua vim.lsp.buf.signature_help()<CR>')
	utils.key_mapper('n', '<leader>ca', ':lua vim.lsp.buf.code_action()<CR>')
	utils.key_mapper('n', '<leader>rn', ':lua vim.lsp.buf.rename()<CR>')
	utils.key_mapper('n', '<leader>[', ':lua vim.lsp.diagnostic.goto_prev()<CR>')
	utils.key_mapper('n', '<leader>]', ':lua vim.lsp.diagnostic.goto_next()<CR>')
	utils.key_mapper('n', '<leader>q', ':lua vim.lsp.diagnostic.set_loclist()<CR>')
	utils.key_mapper('n', '<leader>f', ':lua vim.lsp.buf.formatting()<CR>')
	
	-- [hrsh7th/nvim-compe](https://github.com/hrsh7th/nvim-compe#vim-script-confi)
	utils.key_mapper('i', '<tab>', 'v:lua.tab_complete()', {expr = true})
	utils.key_mapper('s', '<tab>', 'v:lua.tab_complete()', {expr = true})
	utils.key_mapper('i', '<s-tab>', 'v:lua.s_tab_complete()', {expr = true})
	utils.key_mapper('s', '<s-tab>', 'v:lua.s_tab_complete()', {expr = true})

	-- Nerdtree
	utils.key_mapper('n', '<leader>ne', ':NERDTreeToggle<CR>')
	
	utils.key_mapper('', '<leader><Right>', '$')
	utils.key_mapper('', '<leader><Left>', '^')
	utils.key_mapper('', '<leader><Up>', 'H')
	utils.key_mapper('', '<leader><Down>', 'L')
	
end

setup_mappings()
