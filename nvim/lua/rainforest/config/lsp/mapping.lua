local utils = require("rainforest.utils")

G = {}

G.setup_mapping = function(client, bufnr)
	-- Set some keybinds conditional on server capabilities
	-- if client.resolved_capabilities.document_formatting then
		utils.key_mapper({
			mode = "n",
			key = "ff",
			cmd = "<cmd>lua vim.lsp.buf.formatting()<CR>",
			category = "Formatter",
			unique_identifier = "formatter_formatting",
			description = "",
		})
	--[[ elseif client.resolved_capabilities.document_range_formatting then
		utils.key_mapper({
			mode = "n",
			key = "ff",
			cmd = "<cmd>lua vim.lsp.buf_range_formatting()<CR>",
			category = "Formatter",
			unique_identifier = "formatter_range_formatting",
			description = "",
		})
	end ]]
end

return G
