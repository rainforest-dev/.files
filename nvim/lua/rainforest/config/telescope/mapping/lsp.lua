local utils = require("rainforest.utils")
local G = {}

G.setup_mapping = function(client, bufnr)
	utils.key_mapper({
		key = "<leader>ca",
		cmd = ':lua require "telescope.builtin".lsp_code_actions()<CR>',
		options = { noremap = true, silent = true },
		category = "LSP",
		unique_identifier = "lsp_code_action",
		description = "Lists any LSP actions for the word under the cursor, that can be triggered with <cr>",
	})
	utils.key_mapper({
		key = "<leader>dd",
		cmd = ':lua require "telescope.builtin".lsp_document_diagnostics()<CR>',
		options = { noremap = true, silent = true },
		category = "LSP",
		unique_identifier = "lsp_document_diagnostics",
		description = "Lists LSP diagnostics for the current buffer",
	})
	utils.key_mapper({
		key = "<leader>wd",
		cmd = ':lua require "telescope.builtin".lsp_workspace_diagnostics()<CR>',
		options = { noremap = true, silent = true },
		category = "LSP",
		unique_identifier = "lsp_workspace_diagnostics",
		description = "Lists LSP diagnostics for the current workspace",
	})
	utils.key_mapper({
		key = "<leader>r",
		cmd = ':lua require "telescope.builtin".lsp_references()<CR>',
		options = { noremap = true, silent = true },
		category = "LSP",
		unique_identifier = "lsp_references",
		description = "Lists LSP references for word under the cursor",
	})
	utils.key_mapper({
		key = "<leader>ds",
		cmd = ':lua require "telescope.builtin".lsp_document_symbols()<CR>',
		options = { noremap = true, silent = true },
		category = "LSP",
		unique_identifier = "lsp_document_symbols",
		description = "Lists LSP document symbols in the current buffer",
	})
	utils.key_mapper({
		key = "<leader>ws",
		cmd = ':lua require "telescope.builtin".lsp_workspace_symbols()<CR>',
		options = { noremap = true, silent = true },
		category = "LSP",
		unique_identifier = "lsp_workspace_symbols",
		description = "Lists LSP document symbols in the current workspace",
	})
	utils.key_mapper({
		key = "<leader>gi",
		cmd = ':lua require "telescope.builtin".lsp_implementations()<CR>',
		options = { noremap = true, silent = true },
		category = "LSP",
		unique_identifier = "lsp_implementations",
		description = "Goto the implementation of the word under the cursor if there's only one, otherwise show all options in Telescope",
	})
	utils.key_mapper({
		key = "<leader>gd",
		cmd = ':lua require "telescope.builtin".lsp_definitions()<CR>',
		options = { noremap = true, silent = true },
		category = "LSP",
		unique_identifier = "lsp_definitions",
		description = "Goto the definition of the word under the cursor, if there's only one, otherwise show all options in Telescope",
	})
	utils.key_mapper({
		key = "<leader>gtd",
		cmd = ':lua require "telescope.builtin".lsp_type_definitions()<CR>',
		options = { noremap = true, silent = true },
		category = "LSP",
		unique_identifier = "lsp_type_definitions",
		description = "Goto the definition of the type of the word under the cursor, if there's only one, otherwise show all options in Telescope",
	})
end

return G
