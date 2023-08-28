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
        prompt_prefix = '   ',
        sorting_strategy = 'ascending',
        file_ignore_patterns = { '.git/' },
        mappings = {
            n = {
                ["<C-c>"] = require('telescope.actions').close,
                ["<ESC>"] = require('telescope.actions').close,
            },
            -- We are in insert mode when we are searching in searchbar.
            i = {
                ["<C-c>"] = require('telescope.actions').close,
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
