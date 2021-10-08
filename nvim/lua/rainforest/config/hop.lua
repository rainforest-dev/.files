local utils = require 'rainforest.utils'
local which_key = require 'which-key'

require 'hop'.setup()

G = {}

G.setup_mapping = function (client, bufnr)
  which_key.register({
    h = {'<cmd>lua require "hop".hint_char2()<CR>', '2-char mode'},
    l = {'<cmd>lua require "hop".hint_lines()<CR>', 'Line mode'}
  }, {prefix = '<leader>h'})
end

return G
