local packer = require 'packer'

packer.startup(function()
	local use = use
	use {'wbthomason/packer.nvim', opt = true}

	-- colorscheme
	-- use 'whatyouhide/vim-gotham'
	use {
		'dracula/vim', as = 'dracula', 
		config = 'vim.cmd([[colorscheme dracula]])'
	}
	-- status bar
	use {
  	'hoob3rt/lualine.nvim',
		config = function ()
			require 'rainforest.config.statusbar'
		end,
  	requires = {'kyazdani42/nvim-web-devicons', opt = true}
	}

	-- utils
	use 'jiangmiao/auto-pairs'
	-- TODO: Refine key mapping
	use 'folke/which-key.nvim'
	--- language packs for syntax and indentation
	use 'sheerun/vim-polyglot'
	--- cursur movement
	use {
		'phaazon/hop.nvim',
		config = function ()
			require 'rainforest.config.hop'
		end
	}

	-- File Explorer
	use {
		'preservim/nerdtree',
		config = function ()
			require 'rainforest.config.nerdtree'
		end,
		requires = {
			{'tiagofumo/vim-nerdtree-syntax-highlight'},
			{'ryanoasis/vim-devicons'},
			{'Xuyuanp/nerdtree-git-plugin'}
		}
	}

	-- fuzzy finder
	use {
		'nvim-telescope/telescope.nvim',
		config = function ()
			require 'rainforest.config.telescope'
		end,
		requires = {
			{'nvim-lua/popup.nvim'},
			{'nvim-lua/plenary.nvim'},
			{'gbrlsnchs/telescope-lsp-handlers.nvim'},
			{'kyazdani42/nvim-web-devicons'}
		}
	}
	use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
	use 'nvim-telescope/telescope-packer.nvim'
	use {
		'lazytanuki/nvim-mapper',
		config = function ()
			require 'nvim-mapper'.setup{}
		end,
		before = 'telescope.nvim'
	}

	-- LSP and completion
	use {
		'neovim/nvim-lspconfig',
		event = 'BufReadPre',
		config = function ()
			require 'rainforest.config.lsp'
		end,
		requires = {
			{'kabouzeid/nvim-lspinstall'},
			{'RRethy/vim-illuminate'}
		}
	}
	use {
		'hrsh7th/nvim-cmp',
		config = function ()
			require 'rainforest.config.completion'
		end,
		requires = {
			{'hrsh7th/cmp-buffer'},
			{'hrsh7th/cmp-path'},
			{'hrsh7th/cmp-calc'},
			{'hrsh7th/cmp-emoji'},
			{'hrsh7th/cmp-nvim-lsp'},
			{'saadparwaiz1/cmp_luasnip'},
			{'L3MON4D3/LuaSnip'},
		}
	}
	use {
		'tami5/lspsaga.nvim',
		config = function ()
			require 'rainforest.config.lspsaga'
		end
	}


	-- code formatting
	use {
		'sbdchd/neoformat',
		config = function ()
			require 'rainforest.config.formatter'
		end
	}

	-- flutter
	use {'akinsho/flutter-tools.nvim', requires = 'nvim-lua/plenary.nvim'}

	use {
		'nvim-treesitter/nvim-treesitter',
		config = function ()
			require 'rainforest.config.treesitter'
		end,
		run = ':TSUpdate'
	}
	
	-- git
	use {
		'APZelos/blamer.nvim',
		config = function ()
			require 'rainforest.config.git'
		end
	}
end)
