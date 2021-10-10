local utils = require("rainforest.utils")
local Terminal = require("toggleterm.terminal").Terminal

require("toggleterm").setup({
	open_mapping = [[\]],
	insert_mappings = false,
	direction = "float", -- 'vertical' | 'horizontal' | 'window' | 'float'
	close_on_exit = true, -- close the terminal window when the process exits
	shell = vim.o.shell,
	--[[ shade_terminals = true,
  shading_factor = 3, ]]
	float_opts = {
		border = "double", -- 'single' | 'double' | 'shadow' | 'curved' | ... other options supported by win open
	},
})

local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })

function _lazygit_toggle()
	lazygit:toggle()
end

local gotop = Terminal:new({ cmd = 'gotop -l .files/gotop/layouts/rainforest -c vice', hidden = true, dir = '$HOME' })

function _gotop_toggle()
	gotop:toggle()
end

local setup = Terminal:new {cmd = 'nvim', hidden = true, dir = '$HOME/.files/'}

function _setup_toggle()
	setup:toggle()
end

G = {}

G.setup_mapping = function()
	utils.key_mapper({
		key = [[\g]],
		cmd = ":lua _lazygit_toggle()<CR>",
		category = "Terminal",
		unique_identifier = "terminal_lazygit",
		description = "Terminal with lazygit integrated",
	})
	utils.key_mapper({
		key = [[\t]],
		cmd = ":lua _gotop_toggle()<CR>",
		category = "Terminal",
		unique_identifier = "terminal_gotop",
		description = "Terminal with gotop integrated",
	})
	utils.key_mapper({
		key = [[\s]],
		cmd = ":lua _setup_toggle()<CR>",
		category = "Terminal",
		unique_identifier = "terminal_setup",
		description = "Terminal with .files setup integrated",
	})
end

return G
