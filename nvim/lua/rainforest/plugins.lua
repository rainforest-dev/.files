-- Aliases
local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')
local fn = vim.fn    -- to call Vim functions e.g. fn.bufnr()
local execute = vim.api.nvim_command

-- ensure that packer is installed
local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
    execute 'packadd packer.nvim'
end

cmd('packadd packer.nvim')
-- auto compile when there are changes in plugins.lua 
cmd('autocmd BufWritePost plugins.lua PackerCompile')

-- Plugins
local packer = require'packer'
local util = require'packer.util'

packer.init({
	package_root = util.join_paths(fn.stdpath('data'), 'site', 'pack')
})

packer.startup(function()
	local use = use
	use {'wbthomason/packer.nvim', opt = true}

	-- colorscheme
	-- use 'whatyouhide/vim-gotham'
	use {'dracula/vim', as = 'dracula'}
	-- icon pack
	use 'ryanoasis/vim-devicons'

	-- utils
	use 'preservim/nerdtree'
	use 'tiagofumo/vim-nerdtree-syntax-highlight'
	use 'jiangmiao/auto-pairs'
	--- language packs for syntax and indentation
	use 'sheerun/vim-polyglot'

	-- fuzzy finder
	use {
		'nvim-telescope/telescope.nvim',
		requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
	}
	use 'nvim-telescope/telescope-packer.nvim'

	-- LSP and completion
	use 'neovim/nvim-lspconfig'
	use 'kabouzeid/nvim-lspinstall'
	use 'nvim-lua/completion-nvim'

	-- flutter
	use {'akinsho/flutter-tools.nvim', requires = 'nvim-lua/plenary.nvim'}

	use 'nvim-treesitter/nvim-treesitter'
	
	-- git
	use 'APZelos/blamer.nvim'
	end
)
