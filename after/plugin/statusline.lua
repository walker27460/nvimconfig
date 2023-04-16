local tabline = require("tabline")

tabline.setup {
  enable = false,
  options = {
    section_separators = {'', ''},
    component_separators = {'', ''},
    show_devicons = true,
    show_tabs_always = false,
    show_filename_only = true
  }
}

require("lualine").setup {
  options = {
    globalstatus = true,
    icons_enabled = true,
    section_separators = {left = '', right = ''},
    component_separators = {left = '', right = ''},
  },
  sections = {
    lualine_a = {"mode"},
    lualine_b = {},
    lualine_c = {"lsp_progress"}
  },
  tabline = {
    lualine_c = { tabline.tabline_buffers },
    lualine_x = { tabline.tabline_tabs},
  }
}
