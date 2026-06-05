-- [[ Highlight on yank ]]
-- See `:help vim.hl.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    -- vim.highlight was renamed to vim.hl in 0.11 (old alias is deprecated)
    (vim.hl or vim.highlight).on_yank({
      higroup = 'IncSearch',
      timeout = 60,
    })
  end,
  group = highlight_group,
  pattern = '*',
})
