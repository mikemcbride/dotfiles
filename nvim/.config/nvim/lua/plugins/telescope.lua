-- putting all telescope related plugins here for better organization
return {
  {
    'nvim-telescope/telescope.nvim',
    -- master (not 0.1.x): 0.1.x calls the old nvim-treesitter master API
    -- (parsers.ft_to_lang) which is gone on Neovim 0.12 + treesitter `main`.
    branch = 'master',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local fb_actions = require("telescope").extensions.file_browser.actions
      local actions = require('telescope.actions')
      -- [[ Configure Telescope ]]
      -- See `:help telescope` and `:help telescope.setup()`
      require('telescope').setup {
        defaults = {
          file_ignore_patterns = {
            "node_modules",
            "%.git/",
            "%.worktrees/",          -- manual git worktrees
            "%.claude/worktrees/",   -- Claude Code's worktrees (the real dir)
          },
          -- Used by live_grep/grep_string. Default respects .gitignore but NOT
          -- nested worktrees (they aren't gitignored), so exclude them by glob.
          vimgrep_arguments = {
            'rg', '--color=never', '--no-heading', '--with-filename',
            '--line-number', '--column', '--smart-case',
            '--glob', '!**/.git/**',
            '--glob', '!**/.worktrees/**',
            '--glob', '!**/.claude/worktrees/**',
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
            -- Respect .gitignore — the single biggest monorepo speedup, since
            -- ignored build/dep/generated dirs dwarf the tracked files. Still
            -- show tracked dotfiles (--hidden), and explicitly skip nested
            -- worktrees (NOT gitignored) plus node_modules as a backstop.
            find_command = {
              'rg', '--files', '--hidden',
              '--glob', '!**/.git/**',
              '--glob', '!**/node_modules/**',
              '--glob', '!**/.worktrees/**',
              '--glob', '!**/.claude/worktrees/**',
            },
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
          file_browser = {
            theme = "ivy",
            hidden = true, -- show hidden files (dotfiles) in the file browser
            no_ignore = true, -- show ignored files in the browser
            hijack_netrw = true,
            initial_mode = "normal",
            mappings = {
              ["n"] = {
                ["-"] = fb_actions.goto_parent_dir
              }
            }
          }
        }
      }

      -- Enable telescope fzf native, if installed
      pcall(require('telescope').load_extension, 'fzf')

      -- Enable telescope file browser
      pcall(require('telescope').load_extension, 'file_browser')

      -- Enable telescope_mru
      pcall(require('telescope').load_extension, 'mru_files')

      -- [[ Telescope Specific Keymaps ]]
      -- See `:help telescope.builtin`
      vim.keymap.set('n', '<leader>e', ':Telescope file_browser path=%:p:h<cr>', { silent = true })
      vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
      vim.keymap.set('n', '<leader>/', function()
        require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
          winblend = 10,
          previewer = false,
        })
      end, { desc = '[/] Fuzzily search in current buffer]' })

      vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
      vim.keymap.set('n', '<leader>f', require('telescope.builtin').find_files, { desc = 'Search [F]iles' })
      -- On-demand unrestricted search: walks gitignored files too (generated
      -- code, build output). Pays the full-walk cost, so it's a separate
      -- keybind rather than the default. Still skips .git and .worktrees.
      vim.keymap.set('n', '<leader>F', function()
        require('telescope.builtin').find_files {
          prompt_title = 'Find Files (incl. ignored)',
          find_command = {
            'rg', '--files', '--hidden', '--no-ignore',
            '--glob', '!**/.git/**',
            '--glob', '!**/.worktrees/**',
            '--glob', '!**/.claude/worktrees/**',
          },
        }
      end, { desc = 'Search [F]iles (all, incl. gitignored)' })
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
    'nvim-telescope/telescope-file-browser.nvim',
    dependencies = { 'nvim-telescope/telescope.nvim', 'nvim-lua/plenary.nvim' }
  },
  {
    "mikemcbride/telescope-mru.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
  },
}
