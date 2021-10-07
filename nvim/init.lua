local g = vim.g      -- a table to access global variables
local opt = vim.opt  -- to set options

-- Options
local indent, width = 2, 80 
opt.colorcolumn = tostring(width)
opt.cursorline = true
opt.number = true
opt.relativenumber = true
opt.shiftwidth = indent
opt.tabstop = indent
opt.smartcase = true
opt.smartindent = true

opt.encoding = 'utf8'
opt.guifont = 'Fira Code:h14'

-- use the system clipboard as the default register
opt.clipboard = 'unnamed'

require'rainforest'
