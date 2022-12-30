local lsp = require('lsp-zero')
lsp.preset('recommended')

lsp.ensure_installed({
  'gopls',
  'tsserver',
  'tailwindcss',
  'sumneko_lua',
})

lsp.nvim_workspace()

lsp.setup()