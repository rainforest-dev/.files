-- Aliases
local fn = vim.fn     -- to execute Vim commands e.g. cmd('pwd')
local cmd = vim.cmd   -- to call Vim functions e.g. fn.bufnr()
local api = vim.api

local install_path = fn.stdpath('data') .. '/site/pack/packer/opt/packer.nvim'

-- ensure that packer is installed
if fn.empty(fn.glob(install_path)) > 0 then
  print [[ Packer has not been installed yet! ]]
  fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  cmd([[packadd packer.nvim]])
  require 'rainforest.plugins'
  require 'packer'.sync()
end

api.nvim_exec([[
  augroup Packer
    autocmd!
    autocmd BufWritePost init.lua PackerCompile
  augroup end
]], false)

cmd([[packadd packer.nvim]])