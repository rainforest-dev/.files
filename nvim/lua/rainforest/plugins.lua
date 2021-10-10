local packer = require("packer")

packer.startup(function()
	local use = use
	use({ "wbthomason/packer.nvim", opt = true })

	-- colorscheme
	-- use 'whatyouhide/vim-gotham'
	use({
		"dracula/vim",
		as = "dracula",
	})
	use({
		"arcticicestudio/nord-vim",
		config = function()
			local cmd = vim.cmd
			cmd([[colorscheme nord]])
			cmd([[
				:hi clear CursorLine
				:hi CursorLine gui=underline
				:hi ColorColumn guibg=#87c0cf
			]])
		end,
	})
	use({
		"folke/tokyonight.nvim",
		config = function()
			vim.cmd([[colorscheme tokyonight]])
			vim.g.tokyonight_transparent = true
		end,
	})
	use({
		"xiyaowong/nvim-transparent",
		config = function()
			require("transparent").setup({
				enable = true,
			})
		end,
	})
	-- status bar
	use({
		"hoob3rt/lualine.nvim",
		config = function()
			require("rainforest.config.statusbar")
		end,
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})

	-- utils
	--- notifications
	use({
		"rcarriga/nvim-notify",
		config = function()
			require("rainforest.config.notifications")
		end,
	})

	use({
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup({ "*" }, {
				RGB = true, -- #RGB hex codes
				RRGGBB = true, -- #RRGGBB hex codes
				names = true, -- "Name" codes like Blue
				RRGGBBAA = true, -- #RRGGBBAA hex codes
				rgb_fn = true, -- CSS rgb() and rgba() functions
				hsl_fn = true, -- CSS hsl() and hsla() functions
				css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
				css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
				-- Available modes: foreground, background
				mode = "foreground", -- Set the display mode.
			})
		end,
	})
	use("jiangmiao/auto-pairs")
	use({
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			vim.cmd([[:hi IndentBlanklineIndent1 guifg=#bbb, gui=nocombine]])
			require("indent_blankline").setup({
				char = "|",
				char_highlight_list = {
					"IndentBlanklineIndent1",
				},
				show_first_indent_level = true,
				filetype_exclude = { "help", "packer", "dashboard", "NvimTree" },
				buftype_exclude = { "terminal", "nofile" },
				char_highlight = "LineNr",
				show_trailing_blankline_indent = false,
				show_current_context = true,
				context_patterns = {
					"class",
					"function",
					"method",
					"block",
					"list_literal",
					"selector",
					"^if",
					"^table",
					"if_statement",
					"while",
					"for",
				},
			})
		end,
	})
	use("folke/which-key.nvim")
	--- language packs for syntax and indentation
	use("sheerun/vim-polyglot")
	--- cursor movement
	use({
		"phaazon/hop.nvim",
		config = function()
			require("rainforest.config.hop")
		end,
	})
	use({
		"karb94/neoscroll.nvim",
		config = function()
			require("rainforest.config.neoscroll")
		end,
	})
	use({
		"aserowy/tmux.nvim",
		config = function()
			require("rainforest.config.tmux")
		end,
	})
	--- comment tools
	use({
		"b3nj5m1n/kommentary",
		config = function()
			require("rainforest.config.comment")
		end,
	})

	-- File Explorer
	use({
		"kyazdani42/nvim-tree.lua",
		config = function()
			require("rainforest.config.nvim-tree")
		end,
		requires = {
			{ "kyazdani42/nvim-web-devicons" },
		},
	})

	--- Dashboard
	use({
		"glepnir/dashboard-nvim",
		config = function()
			require("rainforest.config.dashboard")
		end,
		requires = { "nvim-telescope/telescope.nvim" },
	})

	-- fuzzy finder
	use({
		"nvim-telescope/telescope.nvim",
		config = function()
			require("rainforest.config.telescope")
		end,
		requires = {
			{ "nvim-lua/popup.nvim" },
			{ "nvim-lua/plenary.nvim" },
			{ "gbrlsnchs/telescope-lsp-handlers.nvim" },
			{ "kyazdani42/nvim-web-devicons" },
		},
	})
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
	use("nvim-telescope/telescope-packer.nvim")
	use({
		"lazytanuki/nvim-mapper",
		config = function()
			require("nvim-mapper").setup({})
		end,
		before = "telescope.nvim",
	})

	use({
		"akinsho/toggleterm.nvim",
		config = function()
			require("rainforest.config.terminal")
		end,
	})

	-- LSP and completion
	use({
		"neovim/nvim-lspconfig",
		config = function()
			require("rainforest.config.lsp")
		end,
		requires = {
			{ "kabouzeid/nvim-lspinstall" },
			{ "RRethy/vim-illuminate" },
		},
	})
	use({
		"hrsh7th/nvim-cmp",
		config = function()
			require("rainforest.config.completion")
		end,
		requires = {
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "hrsh7th/cmp-calc" },
			{ "hrsh7th/cmp-emoji" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "saadparwaiz1/cmp_luasnip" },
			{ "L3MON4D3/LuaSnip" },
			{ "onsails/lspkind-nvim" },
			{ "rafamadriz/friendly-snippets" },
		},
	})
	use({
		"tami5/lspsaga.nvim",
		config = function()
			require("rainforest.config.lspsaga")
		end,
	})
	use({
		"jose-elias-alvarez/null-ls.nvim",
		config = function()
			require("rainforest.config.null-ls")
		end,
		requires = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
	})

	-- flutter
	use({ "akinsho/flutter-tools.nvim", requires = "nvim-lua/plenary.nvim" })

	use({
		"nvim-treesitter/nvim-treesitter",
		config = function()
			require("rainforest.config.treesitter")
		end,
		run = ":TSUpdate",
	})

	-- git
	use({
		"lewis6991/gitsigns.nvim",
		config = function()
			require("rainforest.config.git")
		end,
		requires = {
			"nvim-lua/plenary.nvim",
		},
	})
end)
