local vim = vim

local lspconfig = require("lspconfig")
local installer = require("nvim-lsp-installer")
local utils = require("rainforest.utils")

local servers = {
	"sumneko_lua",
	"diagnosticls",
	"bashls",
	"gopls",
	"dockerls",
	"pyright",
	"yamlls",
	"jsonls",
}

local function on_attach(client, bufnr)
	require("aerial").on_attach(client)
	require("rainforest.config.aerial").setup_mapping()
	require("rainforest.config.lsp.mapping").setup_mapping(client, bufnr)
	-- add signature autocompletion while typing
	require("lsp_signature").on_attach({})
	vim.notify("Attaching to " .. client.name, "info")
end

local function make_config()
	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities.textDocument.completion.completionItem.snippetSupport = true
	capabilities.textDocument.completion.completionItem.resolveSupport = {
		properties = {
			"documentation",
			"detail",
			"additionalTextEdits",
		},
	}
	-- cmp-nvim-lsp
	capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)
	return {
		-- enable snippet support
		capabilities = capabilities,
		-- attach the language server
		on_attach = on_attach,
	}
end

-- setup language servers here
local function setup_servers()
	for _, server in pairs(servers) do
		local ok, analyzer = installer.get_server(server)
		if ok then
			if not analyzer:is_installed() then
				analyzer:install()
			end
		end
	end

	-- register installed language servers
	local installed_servers = installer.get_installed_servers()
	for _, server in pairs(installed_servers) do
		local config = make_config()
		-- language specific config
		utils.switch(server, {
			["lua"] = function() end,
			["go"] = function() end,
		})
		server:setup(config)
	end

	-- flutter
	require("flutter-tools").setup({})
end

setup_servers()

--- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
installer.post_install_hook = function()
	setup_servers() -- reload installed servers
	vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
end
