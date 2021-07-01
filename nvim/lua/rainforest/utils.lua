local M = {}

M.key_mapper = function(mode, key, result, noremap)
	if noremap == nil then noremap = true end
	vim.api.nvim_set_keymap(mode, key, result, {noremap = noremap, silent = true})
end

M.switch = function(param, case_table)
	local case = case_table[param]
	if case then return case() end
	local def = case_table['default']
	return def and def() or nil
end

return M
