local lspconfig = require('lspconfig')
local lsp_defaults = lspconfig.util.default_config

lsp_defaults.capabilities = vim.tbl_deep_extend(
    'force',
    lsp_defaults.capabilities,
    require('cmp_nvim_lsp').default_capabilities()
)

local home = os.getenv("HOME")

lspconfig.phpactor.setup({
    cmd = {home..'/.local/share/nvim/site/pack/packer/opt/phpactor/bin/phpactor', 'language-server'},
})

lspconfig.vuels.setup({
    cmd = {home..'/.local/share/nvim/plugged/vuels/node_modules/vls/bin/vls', '--stdio'},
})

-- lspconfig.html.setup({
--     cmd = {home..'/.local/share/nvim/plugged/vscode-langservers-extracted/bin/vscode-html-language-server', '--stdio'},
--     filetypes = {"html"},
--     configurationSection = {
--         { "html", "css", "javascript" },
--         embeddedLanguages = {
--             css = true,
--             javascript = true,
--         },
--         provideFormatter = true,
--     },
--     settings = {
--         css = {
--             lint = {
--                 validProperties = {},
--             },
--         },
--     },
-- })

lspconfig.cssls.setup({
    cmd = {home..'/.local/share/nvim/plugged/vscode-html-language-server/node_modules/vscode-langservers-extracted/bin/vscode-css-language-server', '--stdio'},
    filetypes = { "css", "scss", "less" },
    settings = {
        css = {
            validate = true
        },
        less = {
            validate = true
        },
        scss = {
            validate = true
        }
    },
    single_file_support = true,
})

vim.api.nvim_create_autocmd('LspAttach', {
    desc = 'LSP actions',
    callback = function()
        local bufmap = function(mode, lhs, rhs)
            local opts = {buffer = true}
            vim.keymap.set(mode, lhs, rhs, opts)
        end

        -- Displays hover information about the symbol under the cursor
        bufmap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>')
        -- Jump to the definition
        bufmap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>')
        -- Jump to declaration
        bufmap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>')
        -- Lists all the implementations for the symbol under the cursor
        bufmap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>')
        -- Jumps to the definition of the type symbol
        bufmap('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>')
        -- Lists all the references 
        bufmap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>')
        -- Displays a function's signature information
        bufmap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<cr>')
        -- Renames all references to the symbol under the cursor
        bufmap('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>')
        -- Selects a code action available at the current cursor position
        bufmap('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>')
        bufmap('x', '<F4>', '<cmd>lua vim.lsp.buf.range_code_action()<cr>')
        -- Show diagnostics in a floating window
        bufmap('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>')
        -- Move to the previous diagnostic
        bufmap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>')
        -- Move to the next diagnostic
        bufmap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>')
    end
})


vim.diagnostic.config({
    virtual_text = false,
    severity_sort = true,
    float = {
        border = 'rounded',
        source = 'always',
        header = '',
        prefix = '',
        --underline= 'severity',
        update_in_insert = false,
    },
})

