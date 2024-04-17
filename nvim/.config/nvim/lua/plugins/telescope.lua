-- putting all telescope related plugins here for better organization
return {
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      -- local fb_actions = require("telescope").extensions.file_browser.actions
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
        },
        extensions = {
          -- file_browser = {
          --   theme = "ivy",
          --   hidden = true, -- show hidden files (dotfiles) in the file browser
          --   no_ignore = true, -- show ignored files in the browser
          --   hijack_netrw = true,
          --   initial_mode = "normal",
          --   mappings = {
          --     ["n"] = {
          --       ["-"] = fb_actions.goto_parent_dir
          --     }
          --   }
          -- }
        }
      }

      -- Enable telescope fzf native, if installed
      pcall(require('telescope').load_extension, 'fzf')

      -- Enable telescope file_browser
      pcall(require('telescope').load_extension, 'file_browser')

      -- [[ Telescope Specific Keymaps ]]
      -- See `:help telescope.builtin`
      vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
      vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
      vim.keymap.set('n', '<leader>/', function()
        require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
          winblend = 10,
          previewer = false,
        })
      end, { desc = '[/] Fuzzily search in current buffer]' })

      -- vim.keymap.set('n', '<leader>e', ':Telescope file_browser path=%:p:h<cr>', { silent = true }) -- todo: might be nice to remove another plugin and just use netrw
      vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
      vim.keymap.set('n', '<leader>f', require('telescope.builtin').find_files, { desc = 'Search [F]iles' })
      vim.keymap.set('n', '<leader>sg', require('telescope.builtin').git_files, { desc = '[S]earch [G]it Files' })
      vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
      vim.keymap.set('n', '<leader>sr', require('telescope.builtin').oldfiles, { desc = '[S]earch [R]ecently opened files' })
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
}
