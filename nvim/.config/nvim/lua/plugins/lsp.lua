return {
  {
    'VonHeikemen/lsp-zero.nvim',
    dependencies = {
      -- LSP Support
      'neovim/nvim-lspconfig',
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      { 'j-hui/fidget.nvim', tag = 'legacy' },
      'folke/neodev.nvim',

      -- Autocompletion
      'hrsh7th/nvim-cmp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-nvim-lua',

      -- Snippets
      {
        'L3MON4D3/LuaSnip',
        config = function()
          require("luasnip.loaders.from_vscode").lazy_load({ paths = { "./lua/user/snippets" } })
        end
      },
      'rafamadriz/friendly-snippets',
    }
  },
}
