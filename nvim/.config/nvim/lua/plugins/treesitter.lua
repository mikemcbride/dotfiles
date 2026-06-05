-- nvim-treesitter `main` branch (required for Neovim 0.12+).
-- The old `master` API (require('nvim-treesitter.configs').setup) is gone:
--   * parsers are installed via require('nvim-treesitter').install()
--   * highlighting is started per-buffer with vim.treesitter.start()
--   * indent/folds use the built-in treesitter expressions
--   * textobjects keymaps are registered manually (no keymaps table)

local langs = {
  'bash',
  'css',
  'fish',
  'go',
  'html',
  'javascript',
  'json',
  'lua',
  'python',
  'ruby',
  'sql',
  'terraform',
  'tsx',
  'typescript',
  'vim',
  'vimdoc',
  'vue',
  'yaml',
}

return {
  {
    'nvim-treesitter/nvim-treesitter',
    branch = 'main',
    lazy = false,
    build = ':TSUpdate',
    config = function()
      -- Install/update the parsers we care about (async).
      require('nvim-treesitter').install(langs)

      -- Start highlighting (+ folds/indent) for any buffer whose parser is
      -- available. Using language.get_lang handles filetype -> parser name
      -- mismatches (e.g. typescriptreact -> tsx).
      vim.api.nvim_create_autocmd('FileType', {
        callback = function(ev)
          local lang = vim.treesitter.language.get_lang(ev.match) or ev.match
          if not pcall(vim.treesitter.start, ev.buf, lang) then
            return
          end
          vim.bo[ev.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
          vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
        end,
      })
    end,
  },

  {
    'nvim-treesitter/nvim-treesitter-textobjects',
    branch = 'main',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    config = function()
      require('nvim-treesitter-textobjects').setup({
        select = {
          lookahead = true, -- jump forward to textobj, similar to targets.vim
        },
        move = {
          set_jumps = true, -- set jumps in the jumplist
        },
      })

      local select = require('nvim-treesitter-textobjects.select')
      local move = require('nvim-treesitter-textobjects.move')
      local swap = require('nvim-treesitter-textobjects.swap')

      -- Selection text objects (visual + operator-pending)
      local selections = {
        ['aa'] = '@parameter.outer',
        ['ia'] = '@parameter.inner',
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
        ['ii'] = '@conditional.inner',
        ['ai'] = '@conditional.outer',
        ['il'] = '@loop.inner',
        ['al'] = '@loop.outer',
        ['at'] = '@comment.outer',
      }
      for lhs, query in pairs(selections) do
        vim.keymap.set({ 'x', 'o' }, lhs, function()
          select.select_textobject(query, 'textobjects')
        end, { desc = 'Select ' .. query })
      end

      -- Movement
      local moves = {
        goto_next_start = { [']m'] = '@function.outer', [']]'] = '@class.outer' },
        goto_next_end = { [']M'] = '@function.outer', [']['] = '@class.outer' },
        goto_previous_start = { ['[m'] = '@function.outer', ['[['] = '@class.outer' },
        goto_previous_end = { ['[M'] = '@function.outer', ['[]'] = '@class.outer' },
      }
      for fn, maps in pairs(moves) do
        for lhs, query in pairs(maps) do
          vim.keymap.set({ 'n', 'x', 'o' }, lhs, function()
            move[fn](query, 'textobjects')
          end, { desc = fn .. ' ' .. query })
        end
      end

      -- Swap
      vim.keymap.set('n', '<leader>a', function()
        swap.swap_next('@parameter.inner')
      end, { desc = 'Swap next parameter' })
      vim.keymap.set('n', '<leader>A', function()
        swap.swap_previous('@parameter.inner')
      end, { desc = 'Swap previous parameter' })
    end,
  },

  {
    'nvim-treesitter/nvim-treesitter-context',
    opts = {
      enable = true,
      max_lines = 0,
      multiline_threshold = 20,
      trim_scope = 'outer',
      mode = 'cursor',
      zindex = 20,
    },
  },

  {
    'numToStr/Comment.nvim',
    opts = {},
  },
}

