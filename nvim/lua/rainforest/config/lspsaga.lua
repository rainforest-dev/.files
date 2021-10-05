local utils = require 'rainforest.utils'
local saga = require 'lspsaga'

saga.init_lsp_saga({
  finder_action_keys = {
    quit = '<Esc>',
  },
  code_action_keys = {
    quit = '<Esc>'
  },
  rename_action_keys = {
    quit = '<Esc>'
  },
  code_action_icon = " ",
  definition_preview_icon = "  ",
  dianostic_header_icon = "   ",
  error_sign = " ",
  finder_definition_icon = "  ",
  finder_reference_icon = "  ",
  hint_sign = "⚡",
  infor_sign = "",
  warn_sign = "",
})

G = {}

G.setup_mapping = function (client, bufnr)
  utils.key_mapper{
    key = '<leader>lf',
    cmd = ':lua require "lspsaga.provider".lsp_finder()<CR>',
    category = 'LSP',
    unique_identifier = 'lspsaga_provider_lsp_finder',
    description = 'lsp provider to find the cursor word definition and reference'
  }
  utils.key_mapper{
    key = '<leader>la',
    cmd = ':lua require "lspsaga.codeaction".code_action()<CR>',
    category = 'LSP',
    unique_identifier = 'lspsaga_codeaction_code_action',
    description = 'code action'
  }
  utils.key_mapper{
    key = '<leader>ld',
    cmd = ':lua require "lspsaga.provider".preview_definition()<CR>',
    category = 'LSP',
    unique_identifier = 'lspsaga_provider_preview_definition',
    description = 'Preview Definition'
  }
  utils.key_mapper{
    key = '<leader>ls',
    cmd = ':lua require "lspsaga.signaturehelp".signature_help()<CR>',
    category = 'LSP',
    unique_identifier = 'lspsaga_signaturehelp_signature_help',
    description = 'show signature help'
  }
  utils.key_mapper{
    key = '<leader>lr',
    cmd = ':lua require "lspsaga.rename".rename()<CR>',
    category = 'LSP',
    unique_identifier = 'lspsaga_rename_rename',
    description = 'Rename'
  }
end

return G