-- MINE --
vim.opt.termguicolors = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.rnu = true
vim.opt.nu = true
vim.opt.incsearch = true -- Show progressive highlight of searched term.
vim.opt.hidden = true
vim.opt.smartindent = true
vim.opt.title = true
vim.opt.smartcase = true
vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.ignorecase = true
vim.opt.wrap = false
vim.opt.mouse = ''
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.undofile = false

-- (https://github.com/jessarcher/dotfiles) --
vim.opt.scrolloff = 8
-- vim.opt.clipboard = 'unnamedplus' -- Use Linux system clipboard
vim.opt.shortmess:append({ I = true }) -- disable the splash screen
--vim.opt.spell = true
--vim.opt.breakindent = true -- maintain indent when wrapping indented lines
--vim.opt.list = true -- enable the below listchars
--vim.opt.listchars = { tab = '▸ ', trail = '·' }
--vim.opt.fillchars:append({ eob = ' ' }) -- remove the ~ from end of buffer
-- vim.opt.sidescrolloff = 8
--vim.opt.backup = true -- automatically save a backup file
--vim.opt.backupdir:remove('.') -- keep backups out of the current directory
--vim.opt.wildmode = 'longest:full,full' -- complete the longest common match, and allow tabbing the results to fully complete them
--vim.opt.signcolumn = 'yes:2'
--vim.opt.showmode = false
---vim.opt.updatetime = 4001 -- Set updatime to 1ms longer than the default to prevent polyglot from changing it
--vim.opt.redrawtime = 10000 -- Allow more time for loading syntax on large files

-- Needed for autocomplete
vim.opt.completeopt = {'menu', 'menuone', 'noselect'}
