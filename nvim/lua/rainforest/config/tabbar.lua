local utils = require("rainforest.utils")

require("bufferline").setup({
	options = {
		numbers = function(opts)
			-- [Customize Guide](https://github.com/akinsho/bufferline.nvim#numbers)
			-- opts = {
			--   raise:		a helper function to convert the passed number to superscript e.g. raise(id)
			--   lower:		a helper function to convert the passed number to subscript e.g. lower(id)
			--   ordinal: The buffer ordinal number
			--   id:      The buffer ID
			-- }
			return string.format("%s.", opts.ordinal)
		end,
		left_trunc_marker = "",
		right_trunc_marker = "",
		diagnostics = "nvim_lsp",
		seperator_style = "slant",
		always_show_bufferline = false,
	},
})

G = {}

G.setup_mapping = function()
	-- navigate
	utils.key_mapper({
		mode = "n",
		key = "<leader>]",
		cmd = "<cmd>BufferLineCycleNext<CR>",
		category = "Tabbar",
		unique_identifier = "tabbar_next_tab",
		description = "Go to next tab",
	})
	-- move
	utils.key_mapper({
		mode = "n",
		key = "<leader>m]",
		cmd = "<cmd>BufferLineMoveNext<CR>",
		category = "Tabbar",
		unique_identifier = "tabbar_move_next_tab",
		description = "Move to next tab",
	})
	utils.key_mapper({
		mode = "n",
		key = "<leader>m[",
		cmd = "<cmd>BufferLineMovePrev<CR>",
		category = "Tabbar",
		unique_identifier = "tabbar_move_prev_tab",
		description = "Move to prev tab",
	})
	--#region Customize Navigate
	utils.key_mapper({
		mode = "n",
		key = "<leader>[",
		cmd = "<cmd>BufferLineCyclePrev<CR>",
		category = "Tabbar",
		unique_identifier = "tabbar_prev_tab",
		description = "Go to prev tab",
	})
	utils.key_mapper({
		mode = "n",
		key = "<leader>1",
		cmd = "<cmd>BufferLineGoToBuffer 1<CR>",
		category = "Tabbar",
		unique_identifier = "tabbar_tab_1",
		description = "Go to tab 1",
	})
	utils.key_mapper({
		mode = "n",
		key = "<leader>1",
		cmd = "<cmd>BufferLineGoToBuffer 1<CR>",
		category = "Tabbar",
		unique_identifier = "tabbar_tab_1",
		description = "Go to tab 1",
	})
	utils.key_mapper({
		mode = "n",
		key = "<leader>2",
		cmd = "<cmd>BufferLineGoToBuffer 2<CR>",
		category = "Tabbar",
		unique_identifier = "tabbar_tab_2",
		description = "Go to tab 2",
	})
	utils.key_mapper({
		mode = "n",
		key = "<leader>3",
		cmd = "<cmd>BufferLineGoToBuffer 3<CR>",
		category = "Tabbar",
		unique_identifier = "tabbar_tab_3",
		description = "Go to tab 3",
	})
	utils.key_mapper({
		mode = "n",
		key = "<leader>4",
		cmd = "<cmd>BufferLineGoToBuffer 4<CR>",
		category = "Tabbar",
		unique_identifier = "tabbar_tab_4",
		description = "Go to tab 4",
	})
	utils.key_mapper({
		mode = "n",
		key = "<leader>5",
		cmd = "<cmd>BufferLineGoToBuffer 5<CR>",
		category = "Tabbar",
		unique_identifier = "tabbar_tab_5",
		description = "Go to tab 5",
	})
	utils.key_mapper({
		mode = "n",
		key = "<leader>6",
		cmd = "<cmd>BufferLineGoToBuffer 6<CR>",
		category = "Tabbar",
		unique_identifier = "tabbar_tab_6",
		description = "Go to tab 6",
	})
	utils.key_mapper({
		mode = "n",
		key = "<leader>7",
		cmd = "<cmd>BufferLineGoToBuffer 7<CR>",
		category = "Tabbar",
		unique_identifier = "tabbar_tab_7",
		description = "Go to tab 7",
	})
	utils.key_mapper({
		mode = "n",
		key = "<leader>8",
		cmd = "<cmd>BufferLineGoToBuffer 8<CR>",
		category = "Tabbar",
		unique_identifier = "tabbar_tab_8",
		description = "Go to tab 8",
	})
	utils.key_mapper({
		mode = "n",
		key = "<leader>9",
		cmd = "<cmd>BufferLineGoToBuffer 9<CR>",
		category = "Tabbar",
		unique_identifier = "tabbar_tab_9",
		description = "Go to tab 9",
	})
	--#endregion
end

return G
