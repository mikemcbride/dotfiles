-- putting all telescope related plugins here for better organization
return {
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local actions = require('telescope.actions')
      -- [[ Configure Telescope ]]
      -- See `:help telescope` and `:help telescope.setup()`
      require('telescope').setup {
        defaults = {
          file_ignore_patterns = {
            "node_modules"
          },
          mappings = {
            i = {
              ['<C-u>'] = false,
              ['<C-d>'] = false,
            },
          },
        },
        pickers = {
          find_files = {
            -- I want to be able to search all files, including hidden and gitignored ones.
            find_command = { 'rg', '--no-ignore', '--files', '--hidden' }
          },
          buffers = {
            show_all_buffers = true,
            sort_lastused = true,
            theme = "dropdown",
            initial_mode = "normal",
            previewer = false,
            mappings = {
              n = {
                ["dd"] = actions.delete_buffer
              },
              i = {
                ["<c-d>"] = actions.delete_buffer
              }
            }
          }
        }
      }

      -- Enable telescope fzf native, if installed
      pcall(require('telescope').load_extension, 'fzf')

      -- Enable telescope_mru
      pcall(require('telescope').load_extension, 'mru_files')

      -- [[ Telescope Specific Keymaps ]]
      -- See `:help telescope.builtin`
      vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
      vim.keymap.set('n', '<leader>/', function()
        require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
          winblend = 10,
          previewer = false,
        })
      end, { desc = '[/] Fuzzily search in current buffer]' })

      vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
      vim.keymap.set('n', '<leader>f', require('telescope.builtin').find_files, { desc = 'Search [F]iles' })
      vim.keymap.set('n', '<leader>sg', require('telescope.builtin').git_files, { desc = '[S]earch [G]it Files' })
      vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
      vim.keymap.set('n', '<leader>r', "<cmd>Telescope mru_files<CR>", { desc = 'Search [R]ecent Files' })
      vim.keymap.set('n', '<leader>sr', "<cmd>Telescope mru_files<CR>", { desc = '[S]earch [R]ecent Files' })
      vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
      vim.keymap.set('n', '<C-t>', require('telescope.builtin').live_grep, { desc = 'Search by Grep' })
      vim.keymap.set('n', '<C-p>', require('telescope.builtin').live_grep, { desc = 'Search by Grep' })
      vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
    end
  },
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'make',
    cond = vim.fn.executable 'make' == 1
  },
  {
    "mikemcbride/telescope-mru.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
  },
}
