local utils = require 'rainforest.utils'

require 'neoscroll'.setup()

G = {}

G.setup_mapping = function (client, bufnr)
  utils.key_mapper{
    key = '<M-UP>',
    cmd = '<C-u>',
    category = 'Scroll',
    unique_identifier = 'scroll_up',
    description = ''
  }
  utils.key_mapper{
    key = '<M-DOWN>',
    cmd = '<C-d>',
    category = 'Scroll',
    unique_identifier = 'scroll_down',
    description = ''
  }
end

return G
