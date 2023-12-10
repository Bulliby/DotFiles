local separator = { '"▏"', color = 'StatusLineNonText' }

require('lualine').setup({
  options = {
    theme =  'onedark',
    globalstatus = false,
    disabled_filetypes = {
      'NvimTree',
    },
  },
  sections = {
    lualine_a = {
      'mode',
    },
    lualine_b = {
      'branch',
      'diff',
      '"🖧  " .. tostring(#vim.tbl_keys(vim.lsp.buf_get_clients()))',
      { 'diagnostics', sources = { 'nvim_diagnostic' } },
    },
    lualine_c = {
      '%F%m',
    },
    lualine_x = {
      'filetype',
      'encoding',
      'fileformat',
    },
    lualine_y = {
    },
    lualine_z = {
      'location',
      'progress',
    },
  },
})
