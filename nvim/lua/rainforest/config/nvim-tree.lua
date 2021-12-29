local g = vim.g
local utils = require 'rainforest.utils'

require 'nvim-tree'.setup {
  -- closes neovim automatically when the tree is the last **WINDOW** in the view
  auto_close = true,
  view = {
    auto_resize = true
  },
  filters = {
    custom = {
      'node_modules', '__pycache__', '.cache'
    }
  }
}

g.nvim_tree_indent_markers = 1
g.nvim_tree_git_hl = 1
g.nvim_tree_refresh_wait = 500

G = {}

G.setup_mapping = function ()
  utils.key_mapper{
    mode = 'n', 
    key = '<C-n>', 
    cmd = ':NvimTreeToggle<CR>',
    category = 'NvimTree',
    unique_identifier = 'nvim_tree_toggle',
    description = ''
  }
  utils.key_mapper{
    mode = 'n', 
    key = '<leader>nf', 
    cmd = ':NvimTreeFindFile<CR>',
    category = 'NvimTree',
    unique_identifier = 'nvim_tree_find_file',
    description = ''
  }
  utils.key_mapper{
    mode = 'n', 
    key = '<leader>nr', 
    cmd = ':NvimTreeRefresh<CR>',
    category = 'NvimTree',
    unique_identifier = 'nvim_tree_refresh',
    description = ''
  }
end

return G
