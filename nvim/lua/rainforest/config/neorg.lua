require("neorg").setup({
	load = {
		["core.defaults"] = {},
		["core.keybinds"] = {
			config = {
				-- TODO: not work currently
				default_keybinds = true,
				neorg_loader = "<C-o>",
			},
		},
		["core.norg.concealer"] = {},
		["core.norg.dirman"] = {
			config = {
				workspaces = {
					global = "$HOME/.org",
				},
				autodect = true,
				autochdir = true,
			},
		},
		["core.norg.completion"] = {
			config = {
				engine = "nvim-cmp",
			},
		},
		["core.integrations.telescope"] = {},
	},
	hook = function() end,
})

local utils = require("rainforest.utils")

G = {}

G.setup_mapping = function()
	utils.key_mapper({
		key = "<leader>og",
		cmd = ':lua require "rainforest.config.telescope.functional".neorg_browser()<CR>',
		category = "Neorg",
		unique_identifier = "neorg_browser",
	})
end

return G
