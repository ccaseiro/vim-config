local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
  execute 'packadd packer.nvim'
end

local use = require('packer').use

return require('packer').startup(function()
  -- Packer can manage itself as an optional plugin
  --use {'wbthomason/packer.nvim', opt = true}
  use 'wbthomason/packer.nvim'

  use 'kyazdani42/nvim-web-devicons'
  use 'kyazdani42/nvim-tree.lua'

  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/nvim-compe'

  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

  -- Telescope
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-media-files.nvim'

end)
