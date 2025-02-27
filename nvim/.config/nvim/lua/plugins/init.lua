return {
  'tpope/vim-fugitive',
  'tpope/vim-sleuth',
  "kyazdani42/nvim-web-devicons",
  {
    "laytan/cloak.nvim",
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
}
