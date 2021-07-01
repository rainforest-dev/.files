local M = {}

M.key_mapper = function(mode, key, result, options)
	if options == nil then options = {} end
	if options.noremap == nil then options.noremap = true end
	if options.silent == nil then options.silent = true end
	vim.api.nvim_set_keymap(mode, key, result, options)
end

M.switch = function(param, case_table)
	local case = case_table[param]
	if case then return case() end
	local def = case_table['default']
	return def and def() or nil
end

return M
