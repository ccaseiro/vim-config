local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
  execute 'packadd packer.nvim'
end

local use = require('packer').use

return require('packer').startup(function()
  -- Packer can manage itself as an optional plugin
  -- use {'wbthomason/packer.nvim', opt = true}
  use 'wbthomason/packer.nvim'

  use 'kyazdani42/nvim-web-devicons'
  use 'kyazdani42/nvim-tree.lua'

  use 'neovim/nvim-lspconfig'
  use 'glepnir/lspsaga.nvim'
  use 'hrsh7th/nvim-compe'
  use 'hrsh7th/vim-vsnip'
  use "rafamadriz/friendly-snippets"
  use 'kosayoda/nvim-lightbulb'
  use 'liuchengxu/vista.vim'
  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup {
        -- auto_preview = false,
        -- auto_fold = true
      }
    end
  }

  -- Debugging
  use "mfussenegger/nvim-dap"
  use "mfussenegger/nvim-dap-python"

  -- Git
  use {'lewis6991/gitsigns.nvim', requires = {'nvim-lua/plenary.nvim'}}

  -- Colorcheme
  use 'christianchiarulli/nvcode-color-schemes.vim'
  use 'folke/tokyonight.nvim'

  -- Status Line and Bufferline
  use {'akinsho/nvim-bufferline.lua', requires = 'kyazdani42/nvim-web-devicons'}
  use "glepnir/galaxyline.nvim"

  -- Treesiter
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
  use 'maxmellon/vim-jsx-pretty'

  -- Telescope
  use {'nvim-telescope/telescope.nvim', requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}}

  -- Note Taking
  -- use 'vimwiki/vimwiki'
  use 'lervag/wiki.vim'

  -- Startup Dashboard
  use 'mhinz/vim-startify'

  -- Web development
  use 'mattn/emmet-vim'

  -- Lisp
  use 'vim-scripts/paredit.vim'
  use 'vlime/vlime'
  -- use 'kovisoft/slimv'

  -- general plugins
  use 'tpope/vim-repeat'
  use 'tpope/vim-surround'
  use 'tpope/vim-commentary'
  use 'tpope/vim-unimpaired'
  use 'justinmk/vim-sneak'
  use 'bfredl/nvim-miniyank'
  use {'windwp/nvim-autopairs', config = function() require('nvim-autopairs').setup({disable_filetype = {"lisp"}}) end}
  use 'norcalli/nvim-colorizer.lua'
  use 'folke/which-key.nvim'
  use 'mbbill/undotree'
  use {"folke/twilight.nvim"}
  use {"folke/zen-mode.nvim"}
  use 'vhyrro/neorg'
  use 'stevearc/qf_helper.nvim'
  use {'ojroques/nvim-bufdel'}
end)
