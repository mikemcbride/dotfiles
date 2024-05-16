return {
  "nvimtools/none-ls.nvim",
  'tpope/vim-fugitive',
  'tpope/vim-sleuth',
  "kyazdani42/nvim-web-devicons",
  {
    'numToStr/Comment.nvim',
    config = true
  },
  {
    "laytan/cloak.nvim",
    config = true
  },
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = true
  },
  {
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    },
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {
      scope = {
        enabled = false
      }
    }
  },
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" }
  },
  {
    'stevearc/oil.nvim',
    opts = {
      default_file_explorer = true,
      view_options = {
        show_hidden = true,
      }
    },
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
}
