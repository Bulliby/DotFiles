vim.g.mapleader = ','
vim.g.maplocalleader = ','

-- Basic mappings
vim.keymap.set('n', '<leader>n', ':NvimTreeToggle<CR>')
vim.keymap.set('n', '<leader>q', ':q<CR>')
-- Cycle and close buffer
vim.keymap.set('n', '<leader>w', ':w<CR>')
vim.keymap.set('n', '<leader>y', '"+y<CR>')
vim.keymap.set('n', '<leader>f', '<C-W><RIGHT>')
vim.keymap.set('n', '<leader>a', '<C-W><LEFT>')
vim.keymap.set('n', '<leader><space>', ':nohlsearch<CR>')
vim.keymap.set('n', '<leader>tg', ':tabprev<CR>')
vim.keymap.set('n', '<leader>tn', ':tabnext<CR>')

-- r used for double key (shortcut less used)
-- Reload all buffers who have changed
vim.keymap.set('n', '<leader>re', ':bufdo checktime<CR>')
vim.keymap.set('n', '<leader>rp', ':set paste!<CR>')
vim.keymap.set('n', '<leader>rf', ':NvimTreeFindFileToggle<CR>')

-- i for insert mode
vim.keymap.set('i', '<leader>jk', '<ESC>')

-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>sF', [[<cmd>lua require('telescope.builtin').find_files({ no_ignore = true, prompt_title = 'All Files' })<CR>]])
vim.keymap.set('n', '<leader>sf', builtin.find_files, {})
vim.keymap.set('n', '<leader>sg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>sb', builtin.buffers, {})
vim.keymap.set('n', '<leader>sh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>sm', builtin.marks, {})
vim.keymap.set('n', '<leader>so', builtin.oldfiles, {})

-- bbye
vim.keymap.set('n', '<leader>x', ':Bdelete<CR>')

-- muscle
vim.keymap.set('i', '<esc>', '<nop>')
vim.keymap.set('i', 'jk', '<esc>')
