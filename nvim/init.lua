local g = vim.g -- a table to access global variables
local opt = vim.opt -- to set options

opt.encoding = "utf8"
opt.guifont = "Fira Code:h14"
opt.termguicolors = true -- True color support

-- Options
local indent, width = 2, 100
opt.colorcolumn = tostring(width)
opt.cursorline = true
opt.number = true
opt.relativenumber = true
opt.shiftwidth = indent
opt.tabstop = indent
opt.smartcase = true
opt.smartindent = true

-- use the system clipboard as the default register
opt.clipboard = "unnamed"
opt.mouse = "a"

require("rainforest")
