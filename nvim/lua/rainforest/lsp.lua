local vim = vim

local lspconfig = require'lspconfig'
local installer = require'lspinstall'
local completion = require'completion'
local utils = require'rainforest.utils'

-- Diagnostics
vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
	vim.lsp.diagnostic.on_publish_diagnostics, {
		underline = true,
		virtual_text = false,
		signs = true,
		update_in_insert = true,
	}
)

local function custom_on_attach(client)
	print('Attaching to ' .. client.name)
	completion.on_attach(client)
end

-- Configure lua language server for neovim development
local lua_settings = {
	Lua = {
		runtime = {
			-- LuaJIT in the case of Neovim
			version = 'LuaJIT',
			path = vim.split(package.path, ';'),
		},
		diagnostics = {
			-- Get the language server to recognize the `vim` global
			globals = {'vim'},
		},
		workspace = {
			[vim.fn.expand('$VIMRUNTIME/lua')] = true,
			[vim.fn.expand('$VIMRUNTIME/lua/rainforest/lsp')] = true,
		}
	}
}

-- config that on_attach and enables snippet support
local function make_config()
	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities.textDocument.completion.completionItem.snippetSupport = true
	return {
		-- enable snippet support
		capabilities = capabilities,
		-- attach the language server
		on_attach = custom_on_attach,
	}
end

-- setup language servers here
local function setup_servers()
	installer.setup()

	-- get all installed servers
	local servers = installer.installed_servers()
	for _, server in pairs(servers) do
		local config = make_config()
		-- language specific config
		utils.switch(server, {
			['lua'] = function ()
				config['settings'] = lua_settings
			end
		})
		lspconfig[server].setup(config)
	end

	-- flutter
	require'flutter-tools'.setup{}
end

setup_servers()

--- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
installer.post_install_hook = function ()
	setup_servers() -- reload installed servers
	vim.cmd('bufdo e') -- this triggers the FileType autocmd that starts the server
end
