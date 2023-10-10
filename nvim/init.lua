require('user.plugins')
require('user.options')
require('user.keymaps')
require('user.abbreviations')
require('user.autocommands')

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local home = os.getenv("HOME")

vim.cmd('source '..home..'/conf/DotFiles/nvim/vimscript/header.vim')
vim.cmd[[colorscheme onedark]]
