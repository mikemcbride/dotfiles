return {
  -- TODO: unsure whether LSP is actually using this or not.
  -- Commenting it out for now, but if I notice things are broken,
  -- this probably needs to get added back
  -- "nvimtools/none-ls.nvim",
  'tpope/vim-fugitive',
  'tpope/vim-sleuth',
  -- TODO: do we need these icons?
  -- I _think_ they are being used in Telescope file search?
  "kyazdani42/nvim-web-devicons",
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
}
