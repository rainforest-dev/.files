local vim = vim
local fn = vim.fn
local api = vim.api
local completion = require'cmp'
local luasnip = require 'luasnip'

vim.o.completeopt = 'menuone,noinsert'

-- [reference](https://github.com/mjlbach/defaults.nvim/blob/master/init.lua)
completion.setup {
  snippet = {
    expand = function (args)
      require 'luasnip'.lsp_expand(args.body)
    end
  },
  mapping = {
    ['<C-p>'] = completion.mapping.select_prev_item(),
    ['<C-n>'] = completion.mapping.select_next_item(),
    ['<C-d>'] = completion.mapping.scroll_docs(-4),
    ['<C-f>'] = completion.mapping.scroll_docs(4),
    ['<C-Space>'] = completion.mapping.complete(),
    ['<C-e>'] = completion.mapping.close(),
    ['<CR>'] = completion.mapping.confirm {
      behavior = completion.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = function (fallback)
      if fn.pumvisible() == 1 then
        fn.feedkeys(api.nvim_replace_termcodes('<C-n>', true, true, true), 'n')
      elseif luasnip.expand_or_jumpable() then
        fn.feedkeys(api.nvim_replace_termcodes('<Plug>luasnip-expand-or-jump', true, true, true), '')
      else
        fallback()
      end
    end,
    ['<S-Tab>'] = function (fallback)
      if fn.pumvisible() == 1 then
        fn.feedkeys(api.nvim_replace_termcodes('<C-p>', true, true, true), 'n')
      elseif luasnip.jumpable(-1) then
        fn.feedkeys(api.nvim_replace_termcodes('<Plug>luasnip-jump-prev', true, true, true), '')
      else
        fallback()
      end
    end
  },
  sources = {
    { name = 'buffer' },
    { name = 'path' },
    { name = 'calc' },
    { name = 'emoji' },
    { name = 'nvim_lsp' },
    { name = 'luasnip' }
  }
}
