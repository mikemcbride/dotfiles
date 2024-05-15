-- just a note for plugins so I don't forget:
-- anything that requires a .setup() function, you need to pass either opts = {} or config = true
-- if you don't plan on passing any other options. This will ensure setup is called. Otherwise it won't call setup.
-- for an example, see Comment.nvim
return {
  "nvimtools/none-ls.nvim",
  'tpope/vim-fugitive',
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
    'numToStr/Comment.nvim',
    opts = {}
  },
  'tpope/vim-sleuth',
  "kyazdani42/nvim-web-devicons",
  {
    "laytan/cloak.nvim",
    config = true
  },
  {
    "echasnovski/mini.pairs",
    version = false,
    event = "InsertEnter",
    config = true,
  },
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" }
  }
}
