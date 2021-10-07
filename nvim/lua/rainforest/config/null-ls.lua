local null_ls = require "null-ls"

null_ls.config {
  debug = true,
  sources = {
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.formatting.yapf,
    null_ls.builtins.code_actions.gitsignsi,
  }
}

require('lspconfig')['null-ls'].setup {}

