return {
  -- 'folke/tokyonight.nvim',
  'electron-highlighter/nvim',

  {
    'VonHeikemen/lsp-zero.nvim',
    dependencies = {
      -- LSP Support
      'neovim/nvim-lspconfig',
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      {'j-hui/fidget.nvim', tag = 'legacy'},
      'folke/neodev.nvim',

      -- Autocompletion
      'hrsh7th/nvim-cmp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-nvim-lua',

      -- Snippets
      'L3MON4D3/LuaSnip',
      'rafamadriz/friendly-snippets',
    }
  },

  {
    "jose-elias-alvarez/null-ls.nvim",
    ft = "go",
  },
  {
    "olexsmir/gopher.nvim",
    ft = "go",
    config = function(_, opts)
      require("gopher").setup(opts)
    end,
    build = function()
      vim.cmd [[silent! GoInstallDeps]]
    end,
  },

  { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    build = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
    end,
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    }
  },

  'tpope/vim-fugitive',
  'lewis6991/gitsigns.nvim',

  'nvim-lualine/lualine.nvim',
  'lukas-reineke/indent-blankline.nvim',
  'numToStr/Comment.nvim',
  'tpope/vim-sleuth',

  -- Fuzzy Finder (files, lsp, etc)
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },

  -- Fuzzy Finder Algorithm which dependencies local dependencies to be built. Only load if `make` is available
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'make',
    cond = vim.fn.executable 'make' == 1
  },

  {
      "nvim-telescope/telescope-file-browser.nvim",
      dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
  },

  "akinsho/bufferline.nvim", -- buffers appear like tabs
  "moll/vim-bbye", -- close buffers
  "goolord/alpha-nvim",
  "ur4ltz/move.nvim", -- move lines
  "nvim-treesitter/nvim-treesitter-context", -- sticky function headers
  "JoosepAlviste/nvim-ts-context-commentstring",
  "kyazdani42/nvim-web-devicons",
  "windwp/nvim-autopairs", -- automatically close matching brackets/parens/etc

}
