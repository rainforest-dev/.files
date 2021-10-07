require 'lualine'.setup {
  options = {
    theme = 'nord',
    section_separators = '',
    component_separators = '|'
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {
      'branch', 
      {
        'diff',
        colored = true,
        color_added = '#a4cf69',
        color_modified = '#63c1e6',
        color_removed = '#d74f56'
      },
    },
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', {'filetype', colored = true}},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  extensions = {'nvim-tree'}
}
