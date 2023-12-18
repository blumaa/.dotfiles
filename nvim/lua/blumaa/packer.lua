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
    'nvim-telescope/telescope.nvim', tag = '0.1.5',
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
  -- use 'tpope/vim-projectionist'

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

  -- ************************************************************
  -- color schemes
  -- ************************************************************
  use { "catppuccin/nvim", as = "catppuccin" }

  -- ************************************************************
  -- extras
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

  -- use { -- color picker with hex
  --   'uga-rosa/ccc.nvim',
  --   config = function()
  --     require('ccc').setup({
  --       highlighter = {
  --         auto_enable = true,
  --         lsp = true,
  --       },
  --     })
  --   end
  -- }

  use('ThePrimeagen/harpoon')
  -- use('mbbill/undotree')
  use 'tpope/vim-surround'

  use({ -- autoclose and autorename tags
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-treesitter.configs").setup({
        autotag = {
          enable = true,
        },
      })
    end,
  })




  -- ************************************************************
  -- Formatting/linting
  -- ************************************************************
  use('MunifTanjim/prettier.nvim')
  -- use 'maxmellon/vim-jsx-pretty'
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
    branch = 'v3.x',
    requires = {
      --- Uncomment these if you want to manage LSP servers from neovim
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },

      -- LSP Support
      { 'neovim/nvim-lspconfig' },
      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'L3MON4D3/LuaSnip' },
    }
  }

  use { "simrat39/rust-tools.nvim" }

  -- ************************************************************
  -- AI Tools
  -- ************************************************************

  -- use { "zbirenbaum/copilot.lua" }
  -- use {
  --   "zbirenbaum/copilot-cmp",
  --   after = { "copilot.lua" },
  --   config = function()
  --     require("copilot_cmp").setup()
  --   end
  -- }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
