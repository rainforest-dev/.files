local utils = require 'rainforest.utils'

require 'hop'.setup()

G = {}

G.setup_mapping = function (client, bufnr)
  utils.key_mapper{
    key = '<leader>hh',
    cmd = '<cmd>lua require "hop".hint_char2()<CR>',
    category = 'Hop',
    unique_identifier = 'hop_hint_char2',
    description = 'A variant of the 1-char mode, this mode exacts the user to type two characters, representing a bigram (they follow each other, in order). The bigram occurrences in the visible part of the buffer will then be highlighted for you to jump to any.'
  }
  utils.key_mapper{
    key = '<leader>hl',
    cmd = '<cmd>lua require "hop".hint_lines()<CR>',
    category = 'Hop',
    unique_identifier = 'hop_hint_lines',
    description = 'This mode highlights the beginnings of each line in the visible part of the buffer for quick line hopping.'
  }
end

return G
