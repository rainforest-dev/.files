local g = vim.g
local utils = require("rainforest.utils")

require("aerial").setup{
	default_bindings = false,
	default_direction = "prefer_right",
	close_behavior = "auto", -- persist | close | auto | global
	manage_folds = true,
	link_tree_to_folds = true, -- Only works when manage_folds is enabled
	link_folds_to_tree = true, -- Only works when manage_folds is enabled
	open_automatic = true,
	open_automatic_min_lines = 100,
	nerd_font = g.nerd_font,
	-- open_automatic_min_symbols = 50,
	--[[ filter_kind = {
		"Class",
		"Constructor",
		"Enum",
		"Function",
		"Interface",
		"Method",
		"Struct",
	}, ]]
}

G = {}

G.setup_mapping = function()
	utils.key_mapper({
		key = "<leader>ol",
		cmd = "<cmd>AerialToggle!<CR>",
		category = "Outline",
		unique_identifier = "outline_toggle",
	})
end

return G
