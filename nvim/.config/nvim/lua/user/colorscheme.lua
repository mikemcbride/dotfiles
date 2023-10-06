vim.opt.background = "dark"
-- set colorscheme to default first, as a fallback,
-- so that we have something set if we don't match on environment variable
vim.cmd.colorscheme "default"

-- local theme = vim.env.CURRENT_THEME

-- if (theme == "gruvbox")
-- then
--   require("gruvbox_material").setup({
--     transparent_mode = true,
--     contrast = "hard",
--     bold = false,
--     italic = {
--       strings = false,
--       comments = false,
--       operators = false,
--       folds = false,
--     },
--   })
--   vim.cmd.colorscheme "gruvbox_material"
-- elseif (theme == "eighties")
-- then
--   require("eighties").setup({
--     transparent_mode = true,
--     bold = false,
--     inverse = false,
--     italic = {
--       strings = false,
--       comments = false,
--       operators = false,
--       folds = false,
--     },
--   })
--   vim.cmd.colorscheme "eighties"
-- elseif (theme == "electronhighlighter")
-- then
  require("electron_highlighter").setup({
    style = "night",
    transparent = true,
    on_highlights = function(hl, c)
      local float_bg = "#1b212c"
      local prompt_bg = "#212836"
      hl.Visual = { bg = c.bg_highlight }
      hl.FloatBorder = { bg = float_bg, fg = c.cyan }
      hl.NormalFloat = { bg = float_bg }
      -- telescope.nvim
      hl.TelescopeNormal         = { bg = float_bg, fg = c.fg }
      hl.TelescopeBorder         = { bg = float_bg, fg = float_bg }
      hl.TelescopeMatching       = { fg = c.orange }
      hl.TelescopeMultiSelection = { fg = c.fg_dark }

      hl.TelescopePreview        = { link = "NormalFloat" }
      hl.TelescopePreviewBorder  = { link = "TelescopeBorder" }
      hl.TelescopePreviewLine    = { link = "NormalFloat" }
      hl.TelescopePreviewNormal  = { link = "NormalFloat" }
      hl.TelescopePreviewTitle   = { bg = c.teal, fg = c.bg_highlight}

      hl.TelescopePrompt         = { link = "TelescopeNormal" }
      hl.TelescopePromptBorder   = { bg = prompt_bg, fg = prompt_bg}
      hl.TelescopePromptNormal   = { bg = prompt_bg, fg = c.fg_dark }
      hl.TelescopePromptPrefix   = { bg = prompt_bg, fg = c.cyan}
      hl.TelescopePromptTitle    = { link = "TelescopePreviewTitle" }

      hl.TelescopeResultsBorder  = { link = "TelescopeBorder" }
      hl.TelescopeResultsNormal  = { link = "NormalFloat" }
      hl.TelescopeResultsTitle   = { link = "TelescopeBorder" }

      hl.TelescopeSelection      = { bg = c.bg_highlight}
      hl.TelescopeSelectionCaret = { fg = c.fg_dark }
    end,

  })
  vim.cmd.colorscheme "electron_highlighter"
-- end
