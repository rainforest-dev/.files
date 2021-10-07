local g = vim.g
local utils = require 'rainforest.utils'

g.kommentary_create_default_mappings = false

G = {}

G.setup_mapping = function (client, bufnr)
  utils.key_mapper{
    key = '<leader>cc',
    cmd = '<Plug>kommentary_line_default',
    category = 'Comment',
    unique_identifier = 'comment_line',
    description = ''
  }
  utils.key_mapper{
    key = '<leader>c',
    cmd = '<Plug>kommentary_motion_default',
    category = 'Comment',
    unique_identifier = 'comment_motion_n',
    description = ''
  }
  utils.key_mapper{
    mode = 'v',
    key = '<leader>c',
    cmd = '<Plug>kommentary_motion_default',
    category = 'Comment',
    unique_identifier = 'comment_motion_v',
    description = ''
  }
  utils.key_mapper{
    key = '<leader>ci',
    cmd = '<Plug>kommentary_motion_increase',
    category = 'Comment',
    unique_identifier = 'comment_motion_increase_n',
    description = ''
  }
  utils.key_mapper{
    key = '<leader>cd',
    cmd = '<Plug>kommentary_motion_decrease',
    category = 'Comment',
    unique_identifier = 'comment_motion_decrease_n',
    description = ''
  }
  utils.key_mapper{
    key = '<leader>cic',
    cmd = '<Plug>kommentary_line_increase',
    category = 'Comment',
    unique_identifier = 'comment_line_increase',
    description = ''
  }
  utils.key_mapper{
    key = '<leader>cdc',
    cmd = '<Plug>kommentary_line_decrease',
    category = 'Comment',
    unique_identifier = 'comment_line_decrease',
    description = ''
  }
  utils.key_mapper{
    mode = 'x',
    key = '<leader>ci',
    cmd = '<Plug>kommentary_motion_increase',
    category = 'Comment',
    unique_identifier = 'comment_motion_increase_x',
    description = ''
  }
  utils.key_mapper{
    mode = 'x',
    key = '<leader>cd',
    cmd = '<Plug>kommentary_motion_decrease',
    category = 'Comment',
    unique_identifier = 'comment_motion_decrease_x',
    description = ''
  }
end

return G
