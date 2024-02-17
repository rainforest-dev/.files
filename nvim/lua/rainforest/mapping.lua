local vim = vim
local utils = require("rainforest.utils")

vim.g.mapleader = " "

local setup_mapping = function()
	require("rainforest.config.telescope.mapping").setup_mapping()
	require("rainforest.config.hop").setup_mapping()
	require("rainforest.config.tmux").setup_mapping()
	require("rainforest.config.comment").setup_mapping()
	require("rainforest.config.neoscroll").setup_mapping()
	require("rainforest.config.nvim-tree").setup_mapping()
	require("rainforest.config.terminal").setup_mapping()
	require("rainforest.config.tabbar").setup_mapping()
	-- require("rainforest.config.neorg").setup_mapping()

	utils.key_mapper({
		mode = "",
		key = "<leader><Right>",
		cmd = "$",
		category = "System",
		unique_identifier = "right_end",
		description = "",
	})
	utils.key_mapper({
		mode = "",
		key = "<leader><Left>",
		cmd = "^",
		category = "System",
		unique_identifier = "left_end",
		description = "",
	})
	utils.key_mapper({
		mode = "",
		key = "<leader><Up>",
		cmd = "H",
		category = "System",
		unique_identifier = "top_end",
		description = "",
	})
	utils.key_mapper({
		mode = "",
		key = "<leader><Down>",
		cmd = "L",
		category = "System",
		unique_identifier = "bottom_end",
		description = "",
	})
end

setup_mapping()
