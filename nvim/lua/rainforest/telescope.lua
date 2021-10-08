local vim = vim
local telescope = require'telescope'
local themes = require'telescope.themes'
local builtin = require'telescope.builtin'
local actions = require'telescope.actions'
local previewers = require'telescope.previewers'

local defaults = {
	mappings = {
		i = {
			['<esc>'] = actions.close,
		}
	}
}

-- local theme_defaults = themes.get_ivy{ win_blend = 10, results_height = .25, width = .65, shorten_path = true }
local theme_defaults = {}

telescope.setup({
	defaults = vim.tbl_extend('error', theme_defaults, defaults, {
		file_previewer = previewers.vim_buffer_cat.new,
		grep_previewer = previewers.vim_buffer_vimgrep.new,
		qflist_previewer = previewers.vim_buffer_qflist.new
	})
})

local M = {}

M.find_files = function()
	builtin.find_files()
end

M.live_grep = function()
	builtin.live_grep()
end

M.help_tags = function()
  builtin.help_tags()
end

M.buffers = function()
  builtin.buffers()
end

-- extensions
--- flutter
telescope.load_extension('flutter')


return M
