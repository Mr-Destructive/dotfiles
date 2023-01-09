require("destructive.options")

local function getWords()
  return tostring(vim.fn.wordcount().words)
end

return require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use 'tpope/vim-fugitive'
  use 'neovim/nvim-lspconfig' 
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'nvim-treesitter/nvim-treesitter'
  use 'nvim-treesitter/playground'
  use 'L3MON4D3/LuaSnip'
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true,
    }
  }
  use {'nvim-telescope/telescope.nvim', tag= '0.1.0',
      requires = { {'nvim-lua/plenary.nvim'} }
  }
  use 'tjdevries/colorbuddy.nvim'
  use 'Mofiqul/dracula.nvim'
  use 'kyazdani42/nvim-web-devicons'
  use {'akinsho/flutter-tools.nvim', requires = 'nvim-lua/plenary.nvim'}
  use 'folke/tokyonight.nvim'
  --use 'Mr-Destructive/dj.vim'
  use 'Mr-Destructive/frontmatter.vim'
  --use 'Mr-Destructive/markrunner.nvim'
  use '/home/meet/code/plugins/dj.vim'
  use '/home/meet/code/plugins/markrunner.nvim'

  use 'simrat39/rust-tools.nvim'
  use {
    "folke/twilight.nvim",
    config = function()
      require("twilight").setup {}
    end
  }
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons',
    },
    tag = 'nightly'
  }
  use {
      "SmiteshP/nvim-navic",
      requires = "neovim/nvim-lspconfig"
  }

require('lualine').setup{
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename',  },
    lualine_x = {'encoding', 'fileformat', 'filetype',getWords,},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  }
}
use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' }
end)

