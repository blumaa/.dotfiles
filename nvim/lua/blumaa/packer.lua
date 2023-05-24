vim.cmd.packadd('packer.nvim')

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Essential
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    -- or                            , branch = '0.1.x',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }
  use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
  use('tpope/vim-fugitive')

  -- Utils
  use('ThePrimeagen/harpoon')
  use('mbbill/undotree')
  use 'tpope/vim-surround'
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
  use {
    "windwp/nvim-autopairs",
    wants = "nvim-treesitter",
    module = { "nvim-autopairs.completion.cmp", "nvim-autopairs" },
    config = function() require("nvim-autopairs").setup {} end
  }
  use 'kyazdani42/nvim-web-devicons'
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
    -- tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }
  use {
    'lewis6991/gitsigns.nvim',
  }
  --  use "p00f/nvim-ts-rainbow"
  --  use {
  --    'nvim-lualine/lualine.nvim',
  --    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  --  }

  -- multi line cursor select
  -- use { 'otavioschwanck/cool-substitute.nvim'}
  use 'mg979/vim-visual-multi'

  -- Colorizer for displaying hex values
  use {
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

  -- use {
  --   "williamboman/mason.nvim",
  --   run = ":MasonUpdate",
  --   requires = {
  --     { 'neovim/nvim-lspconfig' },
  --   },
  --   config = function()
  --     require('mason').setup()
  --   end
  -- }


  -- LSP
  use {
    'VonHeikemen/lsp-zero.nvim',
    requires = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },

      -- Autocompletion
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

  -- color schemes
  -- use { "catppuccin/nvim", as = "catppuccin" }
  -- use 'folke/tokyonight.nvim'
  use 'navarasu/onedark.nvim'


  -- Formatting
  use 'maxmellon/vim-jsx-pretty'
  use('jose-elias-alvarez/null-ls.nvim')
  use('MunifTanjim/prettier.nvim')

  -- AI tools
  use { "zbirenbaum/copilot.lua" }
  use {
    "zbirenbaum/copilot-cmp",
    after = { "copilot.lua" },
    config = function()
      require("copilot_cmp").setup()
    end
  }

  -- use {
  --   'Exafunction/codeium.vim',
  --   config = function()
  --     -- Change '<C-g>' here to any keycode you like.
  --     vim.keymap.set('i', '<C-8>', function() return vim.fn['codeium#Accept']() end, { expr = true })
  --     vim.keymap.set('i', '<c-;>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true })
  --     vim.keymap.set('i', '<c-,>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true })
  --     vim.keymap.set('i', '<c-x>', function() return vim.fn['codeium#Clear']() end, { expr = true })
  --   end
  -- }
  -- use {
  --   "zbirenbaum/copilot.lua",
  --   cmd = "Copilot",
  --   event = "InsertEnter",
  --   config = function()
  --     require("copilot").setup({})
  --   end,
  -- }
end)
