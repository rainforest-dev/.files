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
	require("rainforest.config.neorg").setup_mapping()

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

G = {}

G.setup_lsp_mappings = function(client, bufnr)
	-- LSP
	utils.key_mapper({
		mode = "n",
		key = "<leader>d",
		cmd = ':lua require "telescope.builtin".lsp_workspace_diagnostics()<CR>',
		options = { noremap = true, silent = true },
		category = "LSP",
		unique_identifier = "lsp_workspace_diagnostics",
		description = "",
	})
	utils.key_mapper({
		mode = "n",
		key = "<leader>D",
		cmd = ':lua require "telescope.builtin".lsp_document_diagnostics()<CR>',
		options = { noremap = true, silent = true },
		category = "LSP",
		unique_identifier = "lsp_document_diagnostics",
		description = "",
	})
	utils.key_mapper({
		mode = "n",
		key = "<leader>o",
		cmd = ':lua require "telescope.builtin".lsp_document_symbols()<CR>',
		options = { noremap = true, silent = true },
		category = "LSP",
		unique_identifier = "lsp_document_symbols",
		description = "",
	})
	utils.key_mapper({
		mode = "n",
		key = "<leader>w",
		cmd = ':lua require "telescope.builtin".lsp_workspace_symbols()<CR>',
		options = { noremap = true, silent = true },
		category = "LSP",
		unique_identifier = "lsp_workspace_symbols",
		description = "",
	})

	utils.key_mapper({
		mode = "n",
		key = "<leader>gd",
		cmd = ':lua require "telescope.builtin".lsp_definitions()<CR>',
		options = { noremap = true, silent = true },
		category = "LSP",
		unique_identifier = "lsp_definitions",
		description = "",
	})
	utils.key_mapper({
		mode = "n",
		key = "<leader>gD",
		cmd = ':lua require "telescope.builtin".lsp_declarations()<CR>',
		options = { noremap = true, silent = true },
		category = "LSP",
		unique_identifier = "lsp_declarations",
		description = "",
	})
	utils.key_mapper({
		mode = "n",
		key = "<leader>gi",
		cmd = ':lua require "telescope.builtin".lsp_implementations()<CR>',
		options = { noremap = true, silent = true },
		category = "LSP",
		unique_identifier = "lsp_implementations",
		description = "",
	})
	utils.key_mapper({
		mode = "n",
		key = "<leader>gt",
		cmd = ':lua require "telescope.builtin".lsp_typedefs()<CR>',
		options = { noremap = true, silent = true },
		category = "LSP",
		unique_identifier = "lsp_typedefs",
		description = "",
	})
	utils.key_mapper({
		mode = "n",
		key = "<leader>gr",
		cmd = ':lua require "telescope.builtin".lsp_references()<CR>',
		options = { noremap = true, silent = true },
		category = "LSP",
		unique_identifier = "lsp_references",
		description = "",
	})
end

setup_mapping()

return G
