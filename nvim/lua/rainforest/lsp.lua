local vim = vim

local lspconfig = require'lspconfig'
local installer = require'lspinstall'
local utils = require'rainforest.utils'

local function make_config()
	return {}
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
