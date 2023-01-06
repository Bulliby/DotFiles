-- vim.g.nvim_tree_indent_markers = 1
-- vim.g.nvim_tree_git_hl = 1

require('nvim-tree').setup({
    open_on_setup = true,
    open_on_setup_file = true,
    hijack_cursor = true,
    git = {
        enable = false,
    },
    filesystem_watchers = {
        enable = false,
    },
    actions = {
        open_file = {
            window_picker = {
                enable = false,
            },
        },
    },
    view = {
        number = true,
        relativenumber = true,
        mappings = {
            list = {
                { key = 's', action="vsplit", },
            }
        }
    },
    filters = {
        dotfiles = true,
    }
})

vim.cmd([[
highlight NvimTreeIndentMarker guifg=#30323E
augroup NvimTreeHighlights
autocmd ColorScheme * highlight NvimTreeIndentMarker guifg=#30323E
augroup end
]])
