local M = {}

-- [reference](https://github.com/lazytanuki/nvim-mapper#prevent-issues-when-module-is-not-installed)
M.is_module_available = function (name)
	if package.loaded[name] then
		return true
	else
		for _, searcher in ipairs(package.searchers or package.loaders) do
			local loader = searcher(name)
			if type(loader) == 'function' then
				package.preload[name] = loader
				return true
			end
		end
		return false
	end
end

M.key_mapper = function(args)
	local mode = args.mode or 'n'
	local key = args.key
	local cmd = args.cmd
	local options = args.options or {}
	if options.noremap == nil then options.noremap = true end
	if options.silent == nil then options.silent = true end
	local category = args.category or 'Other'
	local unique_identifier = args.unique_identifier
	local description = args.description or ''
	
	vim.api.nvim_set_keymap(mode, key, cmd, options)
	if M.is_module_available('nvim-mapper') then
		local mapper = require 'nvim-mapper'
		mapper.map(mode, key, cmd, options, category, unique_identifier, description)
	end
	if M.is_module_available('which-key') then
		local wk = require 'which-key'
		wk.register({
			[key] = {cmd, description},
		}, {mode = mode})
	end
end

M.switch = function(param, case_table)
	local case = case_table[param]
	if case then return case() end
	local def = case_table['default']
	return def and def() or nil
end

return M
