require('nvim-treesitter.configs').setup({
    highlight = {
        enable = true,
        disable = { 'NvimTree' },
    },
    indent = {
        enable = true
    },
    ensure_installed = {
        'javascript',
        'css',
        'yaml',
        'json',
        'lua',
        'php',
    },
    textobjects = {
        select = {
            disable = {
                'css',
                'yaml',
                'json',
            },
            enable = true,
            lookahead = true,
            keymaps = {
                ['if'] = '@function.inner',
                ['af'] = '@function.outer',
                ['icl'] = '@class.inner',
                ['acl'] = '@class.outer',
                ['ic'] = '@call.inner',
                ['ac'] = '@call.outer',
                ['iif'] = '@conditional.inner',
                ['aif'] = '@conditional.outer',
                ['il'] = '@loop.inner',
                ['al'] = '@loop.outer',
            },
        },
        move = {
            enable = true,
            set_jumps = true, -- whether to set jumps in the jumplist
            -- next/previous direction
            -- start/end position of the cursor
            goto_next_start = {
                ["mif"] = "@function.inner",
                ["maf"] = "@function.outer",
                ["micl"] = "@class.inner",
                ["macl"] = "@class.outer",
                ["mic"] = "@call.inner",
                ["mac"] = "@call.outer",
                ["miif"] = "@conditional.inner",
                ["maif"] = "@conditional.outer",
                ["mil"] = "@loop.inner",
                ["mal"] = "@loop.outer",
            },
            goto_next_end = {
                ["mIF"] = "@function.inner",
                ["mAF"] = "@function.outer",
                ["mICL"] = "@class.inner",
                ["mACL"] = "@class.outer",
                ["mIC"] = "@call.inner",
                ["mAC"] = "@call.outer",
                ["mIIF"] = "@conditional.inner",
                ["mAIF"] = "@conditional.outer",
                ["mIL"] = "@loop.inner",
                ["mAL"] = "@loop.outer",
            },
            goto_previous_start = {
                ["Mif"] = "@function.inner",
                ["Maf"] = "@function.outer",
                ["Micl"] = "@class.inner",
                ["Macl"] = "@class.outer",
                ["Mic"] = "@call.inner",
                ["Mac"] = "@call.outer",
                ["Miif"] = "@conditional.inner",
                ["Maif"] = "@conditional.outer",
                ["Mil"] = "@loop.inner",
                ["Mal"] = "@loop.outer",
            },
            goto_previous_end = {
                ["MIF"] = "@function.inner",
                ["MAF"] = "@function.outer",
                ["MICL"] = "@class.inner",
                ["MACL"] = "@class.outer",
                ["MIC"] = "@call.inner",
                ["MAC"] = "@call.outer",
                ["MIIF"] = "@conditional.inner",
                ["MAIF"] = "@conditional.outer",
                ["MIL"] = "@loop.inner",
                ["MAL"] = "@loop.outer",
            },
        },
        lsp_interop = {
            enable = true,
            border = 'none',
            floating_preview_opts = {},
            peek_definition_code = {
                ["<leader>df"] = "@function.outer",
                ["<leader>dcl"] = "@class.outer",
            },
        },
    },
})
