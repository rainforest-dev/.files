local fn = vim.fn
F = {}

F.grep_prompt = function()
	require("telescope.builtin").grep_string({
		path_display = { "shorten" },
		search = fn.input("Rg> "),
	})
end

F.neorg_browser = function()
	require("telescope.builtin").file_browser({
		cwd = "$HOME/.org",
		hidden = true,
	})
end

return F
