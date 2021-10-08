local saga = require 'lspsaga'
local which_key = require 'which-key'
saga.init_lsp_saga({
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
  which_key.register({
    f = {':lua require "lspsaga.provider".lsp_finder()<CR>', 'Async Lsp Finder'},
    a = {':lua require "lspsaga.codeaction".code_action()<CR>', 'Code Action'},
    -- d = {':lua require "lspsaga.hover".render_hover_doc()<CR>', 'Hover Doc'},
    d = {':lua require "lspsaga.provider".preview_definition()<CR>', 'Preview Definition'},
    -- d = {':lua require "lspsaga.diagnostic".show_cursor_diagnostics()<CR>', 'Hover Doc'},
    ['<Up>'] = {':lua require "lspsaga.action".smart_scroll_with_saga(-1)<CR>', 'Scroll Up'},
    ['<Down>'] = {':lua require "lspsaga.action".smart_scroll_with_saga(1)<CR>', 'Scroll Down'},
    s = {':lua require "lspsaga.signaturehelp".signature_help()<CR>', 'Signature Help'},
    r = {':lua require "lspsaga.rename".rename()<CR>', 'Rename'},
  }, {prefix = '<leader>l'})
end

return G