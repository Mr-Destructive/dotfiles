return require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use 'tpope/vim-fugitive'
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  use 'Mofiqul/dracula.nvim'
  use 'navarasu/onedark.nvim'
  use 'kyazdani42/nvim-web-devicons'
  use 'ryanoasis/vim-devicons'
  use 'vim-airline/vim-airline'
  use 'vim-airline/vim-airline-themes'
  use 'preservim/nerdtree'
end)



