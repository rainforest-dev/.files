local fn = vim.fn
F = {}

F.grep_prompt = function ()
	require 'telescope.builtin'.grep_string {
		path_display = { 'shorten' },
		search = fn.input 'Rg> '
	}
end

return F
