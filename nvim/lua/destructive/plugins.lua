require("destructive.options")

local function getWords()
  return tostring(vim.fn.wordcount().words)
end

return require("packer").startup(function()
  use "wbthomason/packer.nvim"
  use "tpope/vim-fugitive"
  use "neovim/nvim-lspconfig" 
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-path"
  use "nvim-treesitter/nvim-treesitter"
  use "nvim-treesitter/playground"
  use "L3MON4D3/LuaSnip"
  use {
    "nvim-lualine/lualine.nvim",
    requires = { "kyazdani42/nvim-web-devicons", opt = true,
    }
  }
  use { "nvim-telescope/telescope.nvim", tag = '0.1.4' ,
      requires = { {"nvim-lua/plenary.nvim"} }
  }
  use "tjdevries/colorbuddy.nvim"
  use "Mofiqul/dracula.nvim"
  use {"akinsho/flutter-tools.nvim", requires = "nvim-lua/plenary.nvim"}
  use "folke/tokyonight.nvim"
  use { "catppuccin/nvim", as = "catpuccin" }
  --use "Mr-Destructive/dj.vim"
  use "Mr-Destructive/frontmatter.vim"
  use "Mr-Destructive/markrunner.nvim"
  --use "/home/meet/code/plugins/dj.vim"
  --use "/home/meet/code/plugins/markrunner.nvim"

  use "simrat39/rust-tools.nvim"
  use {
    "nvim-tree/nvim-tree.lua",
    requires = {
     "nvim-tree/nvim-web-devicons",
    },
  }
  use {
      "SmiteshP/nvim-navic",
      requires = "neovim/nvim-lspconfig"
  }

require("lualine").setup{
  options = {
      theme = "catppuccin",
  },
  sections = {
    lualine_a = {"mode"},
    lualine_b = {"branch", "diff", "diagnostics"},
    lualine_c = {"filename",  },
    lualine_x = {"encoding", "fileformat", "filetype",getWords,},
    lualine_y = {"progress"},
    lualine_z = {"location"}
  }
}

require("catppuccin").setup({
    integrations ={
        nvimtree = true,
    }
})

-- debugger
  use { "mfussenegger/nvim-dap" }
  use { "theHamsta/nvim-dap-virtual-text" }
  use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }
  use { "mfussenegger/nvim-dap-python" }
  use { "leoluz/nvim-dap-go" }
  use { "nvim-telescope/telescope-dap.nvim" }

use { "TimUntersberger/neogit", requires = "nvim-lua/plenary.nvim" }

use { "williamboman/mason.nvim" }
use { "lewis6991/gitsigns.nvim" }
use { "m4xshen/autoclose.nvim" }
use {'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async'}
use {"nvim-tree/nvim-web-devicons", tag="nerd-v2-compat",}
--
---- codeium
--
use {
  'Exafunction/codeium.vim',
  config = function ()
    vim.keymap.set('i', '<C-g>', function () return vim.fn['codeium#Accept']() end, { expr = true })
    vim.keymap.set('i', '<c-;>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true })
    vim.keymap.set('i', '<c-,>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true })
    vim.keymap.set('i', '<c-x>', function() return vim.fn['codeium#Clear']() end, { expr = true })
end
}
use {"David-Kunz/gen.nvim",
 opts = {
        model = "llama2",
        display_mode = "float",
        debug = true,
    }
}
--use {
--    'numToStr/Comment.nvim',
--    config = function()
--        require('Comment').setup()
--    end
--}
    use { 'sourcegraph/sg.nvim', run = 'nvim -l build/init.lua' }
--
--  use "numToStr/FTerm.nvim"
--
---- locals
--  use {"~/code/plugins/sqlite.nvim" }


--  grammar lsp
   --use { 'valentjn/ltex-ls'}

end)

