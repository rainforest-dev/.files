-- no need to load this immediately, since we have packer_compiled
vim.defer_fn(function ()
  require 'rainforest.bootstrap'
  require 'rainforest.plugins'
  require 'rainforest.mappings'
end, 0)
