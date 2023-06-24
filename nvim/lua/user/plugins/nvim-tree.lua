local function on_attach(bufnr)
    local api = require "nvim-tree.api"
    local function opts(desc)
        return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end
    -- default mappings
    api.config.mappings.default_on_attach(bufnr)
    vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))
    vim.keymap.set('n', 's', api.node.open.vertical, opts('Open: Vertical Split'))
end


require('nvim-tree').setup({
    on_attach = on_attach,
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
