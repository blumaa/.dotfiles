local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  -- ************************************************************
  -- Essential Core
  -- ************************************************************
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.2',
    -- or                            , branch = '0.1.x',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }

  use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
  --   use('tpope/vim-fugitive')
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
    tag = 'nightly'                  -- optional, updated every week. (see issue #1193)
  }
  -- ************************************************************
  -- ruby projectionist
  -- ************************************************************
  use 'tpope/vim-projectionist'

  -- ************************************************************
  -- testing
  -- ************************************************************

  use {
    "nvim-neotest/neotest",
    requires = {
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      'haydenmeade/neotest-jest',
    },
  }

  use "janko-m/vim-test"

  -- use {
  --   "klen/nvim-test",
  --   config = function()
  --     require('nvim-test').setup()
  --   end
  -- }

  -- ************************************************************
  -- color schemes
  -- ************************************************************
  use { "catppuccin/nvim", as = "catppuccin" }

  -- ************************************************************
  -- extra
  -- ************************************************************
  -- use 'luochen1990/rainbow' -- rainbow parentheses
  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup({
        pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
      })
    end
  }
  use 'JoosepAlviste/nvim-ts-context-commentstring'
  use "lukas-reineke/indent-blankline.nvim"

  use { -- color picker with hex
    'uga-rosa/ccc.nvim',
    config = function()
      require('ccc').setup({
        highlighter = {
          auto_enable = true,
          lsp = true,
        },
      })
    end
  }

  use('ThePrimeagen/harpoon')
  use('mbbill/undotree')
  use 'tpope/vim-surround'
  use {
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  }
  use { 'm4xshen/autoclose.nvim',
    config = function() require("autoclose").setup {} end
  }


  -- use 'kyazdani42/nvim-web-devicons'

  -- ************************************************************
  -- Formatting/linting
  -- ************************************************************
  use('MunifTanjim/prettier.nvim')
  use 'maxmellon/vim-jsx-pretty'
  use('jose-elias-alvarez/null-ls.nvim')


  -- ************************************************************
  -- Git
  -- ************************************************************
  use {
    'lewis6991/gitsigns.nvim',
  }

  -- ************************************************************
  -- LSP
  -- ************************************************************

  use {
    'VonHeikemen/lsp-zero.nvim',
    requires = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },

      -- Autocompletion
      { 'L3MON4D3/LuaSnip' },
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-nvim-lua' },

      -- Snippets
      { 'L3MON4D3/LuaSnip' },
      { 'rafamadriz/friendly-snippets' },
    }
  }


  -- ************************************************************
  -- AI Tools
  -- ************************************************************
  use { "zbirenbaum/copilot.lua" }
  use {
    "zbirenbaum/copilot-cmp",
    after = { "copilot.lua" },
    config = function()
      require("copilot_cmp").setup()
    end
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
