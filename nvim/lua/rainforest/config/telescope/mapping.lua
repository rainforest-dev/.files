local utils = require("rainforest.utils")

G = {}

G.setup_mapping = function(client, bufnr)
	utils.key_mapper({
		mode = "n",
		key = "<leader>ff",
		cmd = ':lua require"telescope.builtin".find_files()<CR>',
		category = "Telescope",
		unique_identifier = "telescope_builtin_find_files",
		description = "Lists files in your current working directory, respects .gitignore",
	})
	utils.key_mapper({
		mode = "n",
		key = "<leader>fg",
		cmd = ':lua require"telescope.builtin".live_grep()<CR>',
		category = "Telescope",
		unique_identifier = "telescope_builtin_live_grep",
		description = "Search for a string in your current working directory and get results live as you type (respecting .gitignore)",
	})
	utils.key_mapper({
		mode = "n",
		key = "<leader>fb",
		cmd = ':lua require"telescope.builtin".buffers()<CR>',
		category = "Telescope",
		unique_identifier = "telescope_builtin_buffers",
		description = "Lists open buffers in current neovim instance",
	})
	utils.key_mapper({
		mode = "n",
		key = "<leader>fn",
		cmd = ':lua require"telescope.builtin".help_tags()<CR>',
		category = "Telescope",
		unique_identifier = "telescope_builtin_help_tags",
		description = "Lists available help tags and opens a new window with the relevant help info on <cr>",
	})
	utils.key_mapper({
		mode = "n",
		key = "<leader>km",
		cmd = ":Telescope mapper<CR>",
		category = "Telescope",
		unique_identifier = "telescope_key_mapping",
		description = "Show key mapping",
	})
	utils.key_mapper({
		mode = "n",
		key = "<leader>co",
		cmd = ':lua require"telescope.builtin".colorscheme()<CR>',
		category = "Telescope",
		unique_identifier = "telescope_builtin_colorscheme",
		description = "Lists available colorschemes and applies them on <cr>",
	})
	utils.key_mapper({
		mode = "n",
		key = "<leader>gs",
		cmd = ':lua require"telescope.builtin".git_status()<CR>',
		category = "Telescope",
		unique_identifier = "telescope_builtin_git_status",
		description = "Lists current changes per file with diff preview and add action. (Multi-selection still WIP)",
	})

	--#region extensions
	utils.key_mapper({
		mode = "n",
		key = "<leader>tp",
		cmd = ':lua require"telescope".extensions.packer.plugins(opts)<CR>',
		category = "Telescope",
		unique_identifier = "telescope_extensions_packer",
		description = "",
	})
	----flutter-tools.nvim
	utils.key_mapper({
		mode = "n",
		key = "<F5>",
		cmd = ':lua require"telescope".extensions.flutter.commands()<CR>',
		category = "Telescope",
		unique_identifier = "telescope_extensions_flutter_commands",
		description = "",
	})
	--#endregion
end

return G
