local vim = vim
local telescope = require("telescope")
local themes = require("telescope.themes")
local builtin = require("telescope.builtin")
local actions = require("telescope.actions")
local previewers = require("telescope.previewers")

local defaults = {
	mappings = {
		i = {
			["<esc>"] = actions.close,
		},
	},
}

-- local theme_defaults = themes.get_ivy{ win_blend = 10, results_height = .25, width = .65, shorten_path = true }
local theme_defaults = {}

telescope.setup({
	defaults = vim.tbl_extend("error", theme_defaults, defaults, {
		file_previewer = previewers.vim_buffer_cat.new,
		grep_previewer = previewers.vim_buffer_vimgrep.new,
		qflist_previewer = previewers.vim_buffer_qflist.new,
	}),
	extensions = {
		fzf = {
			fuzzy = true, -- false will only do exact matching
			override_generic_sorter = true, -- override the generic sorter
			override_file_sorter = true, -- override the file sorter
			case_mode = "smart_case", -- or "ignore_case" or "respect_case"
			-- the default case_mode is "smart_case"
		},
		lsp_handlers = {
			code_action = {
				telescope = require("telescope.themes").get_dropdown({}),
			},
		},
	},
})

require("nvim-mapper").setup({
	no_map = false,
	search_path = os.getenv("HOME") .. "/.config/nvim/lua",
	-- what should be done with the selected keybind when pressing enter.
	-- Available actions:
	--   * "definition" - Go to keybind definition (default)
	--   * "execute" - Execute the keybind command
	action_on_enter = "execute",
})

-- extensions
telescope.load_extension("aerial")
telescope.load_extension("fzf")
telescope.load_extension("lsp_handlers")
telescope.load_extension("mapper")
--- flutter
telescope.load_extension("flutter")
