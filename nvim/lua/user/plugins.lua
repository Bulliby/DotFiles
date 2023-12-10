-- Install packer
local ensure_packer = function ()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

-- Initialize packer
require('packer').init({
  compile_path = vim.fn.stdpath('data')..'/site/plugin/packer_compiled.lua',
  display = {
    open_fn = function()
      return require('packer.util').float({ border = 'solid' })
    end,
  },
})

local use = require('packer').use

-- Install plugins
use 'wbthomason/packer.nvim' -- Let packer manage itself

-- toggle gc
use 'tpope/vim-commentary'

-- color perf
use 'navarasu/onedark.nvim'
use 'moll/vim-bbye'

use({
  'kyazdani42/nvim-tree.lua',
  requires = 'kyazdani42/nvim-web-devicons',
  config = function()
    require('user.plugins.nvim-tree')
  end,
})

use({
  'nvim-lualine/lualine.nvim',
  requires = { 'kyazdani42/nvim-web-devicons', opt = true },
  config = function()
    require('user.plugins.lualine')
  end,
})

use({
  'nvim-treesitter/nvim-treesitter',
  run = ':TSUpdate',
  requires = {
    {'nvim-treesitter/nvim-treesitter-textobjects'},
  },
  config = function()
    require('user.plugins.treesitter')
  end,
})

use({
  'nvim-telescope/telescope.nvim',
  requires = {
    { 'nvim-lua/plenary.nvim' },
    { 'BurntSushi/ripgrep' },
    { 'kyazdani42/nvim-web-devicons' },
    { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
    { 'nvim-telescope/telescope-live-grep-args.nvim' },
  },
  config = function()
    require('user.plugins.telescope')
  end,
})

use({
  'neovim/nvim-lspconfig',
  requires = {
    'b0o/schemastore.nvim',
    'folke/lsp-colors.nvim',
  },
  config = function()
    require('user.plugins.lspconfig')
  end,
})

use({
  'phpactor/phpactor',
  branch = 'master',
  ft = 'php',
  run = 'composer install --no-dev -o',
  config = function()
    require('user.plugins.phpactor')
  end,
})

use({
  'ncm2/ncm2',
  requires = {
    'roxma/nvim-yarp',
    'phpactor/ncm2-phpactor',
  },
})

-- auto-complete
use({
  'hrsh7th/nvim-cmp',
  requires = {
    {'hrsh7th/cmp-path'},
    {'hrsh7th/cmp-buffer'},
    {'hrsh7th/cmp-nvim-lsp'},
    {'saadparwaiz1/cmp_luasnip'},
    {'L3MON4D3/LuaSnip'},
    {'rafamadriz/friendly-snippets'},
  },
  config = function()
    require('user.plugins.snippet')
    require('user.plugins.cmp')
  end,
})
