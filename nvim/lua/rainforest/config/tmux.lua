local utils = require 'rainforest.utils'

require 'tmux'.setup {
  copy_sync = {
    -- enables copy sync and overwrites all register actions to
    -- sync registers *, +, unnamed, and 0 till 9 from tmux in advance
    enable = false,

    -- TMUX >= 3.2: yanks (and deletes) will get redirected to system
    -- clipboard by tmux
    redirect_to_clipboard = false,

    -- offset controls where register sync starts
    -- e.g. offset 2 lets registers 0 and 1 untouched
    register_offset = 0,

    -- sync clipboard overwrites vim.g.clipboard to handle * and +
    -- registers. If you sync your system clipboard without tmux, disable
    -- this option!
    sync_clipboard = true,

    -- syncs deletes with tmux clipboard as well, it is adviced to
    -- do so. Nvim does not allow syncing registers 0 and 1 without
    -- overwriting the unnamed register. Thus, ddp would not be possible.
    sync_deletes = true,
  },
  navigation = {
    -- cycles to opposite pane while navigating into the border
    cycle_navigation = true,

    -- enables default keybindings (C-hjkl) for normal mode
    enable_default_keybindings = true,

    -- prevents unzoom tmux when navigating beyond vim border
    persist_zoom = false,
  },
  resize = {
    -- enables default keybindings (A-hjkl) for normal mode
    enable_default_keybindings = false,

    -- sets resize steps for x axis
    resize_step_x = 1,

    -- sets resize steps for y axis
    resize_step_y = 1,
  }
}


G = {}

G.setup_mapping = function ()
  -- utils.key_mapper{
  --   mode = 'n',
  --   key = '<M-LEFT>',
  --   cmd = ':lua require "tmux".move_left()<CR>',
  --   category = 'Tmux',
  --   unique_identifier = 'tmux_move_left',
  --   description = ''
  -- }
  -- utils.key_mapper{
  --   mode = 'n',
  --   key = '<M-DOWN>',
  --   cmd = ':lua require "tmux".move_bottom()<CR>',
  --   category = 'Tmux',
  --   unique_identifier = 'tmux_move_bottom',
  --   description = ''
  -- }
  -- utils.key_mapper{
  --   mode = 'n',
  --   key = '<M-UP>',
  --   cmd = ':lua require "tmux".move_top()<CR>',
  --   category = 'Tmux',
  --   unique_identifier = 'tmux_move_top',
  --   description = ''
  -- }
  -- utils.key_mapper{
  --   mode = 'n',
  --   key = '<M-RIGHT>',
  --   cmd = ':lua require "tmux".move_right()<CR>',
  --   category = 'Tmux',
  --   unique_identifier = 'tmux_move_right',
  --   description = ''
  -- }
  utils.key_mapper{
    mode = 'n',
    key = '<S-h>',
    cmd = ':lua require "tmux".resize_left()<CR>',
    category = 'Tmux',
    unique_identifier = 'tmux_resize_left',
    description = ''
  }
  utils.key_mapper{
    mode = 'n',
    key = '<S-j>',
    cmd = ':lua require "tmux".resize_bottom()<CR>',
    category = 'Tmux',
    unique_identifier = 'tmux_resize_bottom',
    description = ''
  }
  utils.key_mapper{
    mode = 'n',
    key = '<S-k>',
    cmd = ':lua require "tmux".resize_top()<CR>',
    category = 'Tmux',
    unique_identifier = 'tmux_resize_top',
    description = ''
  }
  utils.key_mapper{
    mode = 'n',
    key = '<S-l>',
    cmd = ':lua require "tmux".resize_right()<CR>',
    category = 'Tmux',
    unique_identifier = 'tmux_resize_right',
    description = ''
  }
end

return G
