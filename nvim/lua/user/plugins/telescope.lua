local telescope = require('telescope')
local actions = require('telescope.actions')

vim.cmd([[
  highlight link TelescopePromptTitle PMenuSel
  highlight link TelescopePreviewTitle PMenuSel
  highlight link TelescopePromptNormal NormalFloat
  highlight link TelescopePromptBorder FloatBorder
  highlight link TelescopeNormal CursorLine
  highlight link TelescopeBorder CursorLineBg
]])

telescope.setup({
  defaults = {
    path_display = { truncate = 1 },
    prompt_prefix = '   >>>',
    sorting_strategy = 'ascending',
    file_ignore_patterns = { '.git/' },
    mappings = {
      n = {
        ["<ESC>"] = 'close',
        ["<leader>h"] = 'which_key',
        ["<leader>p"] = require('telescope.actions.layout').toggle_preview,
      },
      -- We are in insert mode when we are searching in searchbar.
      i = {
        ["<C-c>"] = 'close',
        ["<C-n>"] = 'cycle_history_next',
        ["<C-p>"] = 'cycle_history_prev',
        ["<leader>h"] = 'which_key',
      },
    },
  },
  pickers = {
    find_files = {
      hidden = true,
    },
    buffers = {
      previewer = false,
      layout_config = {
        width = 80,
      },
    },
    oldfiles = {
      prompt_title = 'History',
    },
    lsp_references = {
      previewer = false,
    },
  },
})

telescope.load_extension('fzf')
