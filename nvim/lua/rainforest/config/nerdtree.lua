local utils = require 'rainforest.utils'

G = {}

G.setup_mapping = function ()
  utils.key_mapper{
    mode = 'n', 
    key = '<leader>ne', 
    cmd = ':NERDTreeToggle<CR>',
    category = 'Nerdtree',
    unique_identifier = 'nerdtree_toggle',
    description = ''
  }
end

return G