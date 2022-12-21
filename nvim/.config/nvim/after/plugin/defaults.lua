-- this is where my overrides will go.
-- things like options not included in the default kickstart.nvim file,
-- as well as some keymaps.

-- ====================
-- OPTIONS
-- ====================
vim.o.backup = false -- creates a backup file
vim.o.clipboard = "unnamedplus" -- allows neovim to access the system clipboard
vim.o.cmdheight = 1 -- set the height of the command line to 1 row
vim.o.conceallevel = 0 -- so that `` is visible in markdown files
vim.o.fileencoding = "utf-8" -- the encoding written to a file
vim.o.mouse = "" -- never allow the mouse to be used in neovim
vim.o.ruler = false -- disable the indent guide/ruler
vim.o.pumheight = 10 -- pop up menu height
vim.o.showmode = false -- we don't need to see things like -- INSERT -- anymore
vim.o.showtabline = 2 -- always show tabs
vim.o.smartindent = true -- make indenting smarter again
vim.o.splitbelow = true -- force all horizontal splits to go below current window
vim.o.splitright = true -- force all vertical splits to go to the right of current window
vim.o.swapfile = false -- creates a swapfile
vim.o.timeoutlen = 500 -- time to wait for a mapped sequence to complete (in milliseconds)
vim.o.writebackup = false -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
vim.o.expandtab = true -- convert tabs to spaces
vim.o.cursorline = false -- highlight the current line
vim.o.number = true -- set numbered lines
vim.o.relativenumber = true -- set relative numbered lines
vim.o.numberwidth = 4 -- set number column width to 4
vim.o.signcolumn = "yes" -- always show the sign column, otherwise it would shift the text each time
vim.o.wrap = false -- display lines as one long line
vim.wo.colorcolumn = "120" -- show a wrap guide at 120 characters (but we don't wrap)
vim.o.scrolloff = 8 -- start scrolling when you are this many lines from the bottom/top of the screen
vim.o.sidescrolloff = 8 -- start scrolling when you are this many columns from the left/right of the screen


-- ====================
-- KEYMAPS
-- ====================

-- Telescope
vim.keymap.set('n', '<leader>f',  require('telescope.builtin').git_files, { desc = 'Search [F]iles' })

-- Open explore panel
vim.keymap.set('n', '<leader>e', ':Ex<Cr>', { silent = true })

-- greatest remap ever
-- don't replace paste buffer when pasting over highlighted text
vim.keymap.set("x", "<leader>p", "\"_dP", { silent = true })

-- stole these next two from ThePrimeagen, that beautiful genius:
-- tmux-sessionizer
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>", { silent = true })

-- make the current file executable from within the file
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- tmux-session-switcher
vim.keymap.set("n", "<C-g>", "<cmd>silent !tmux neww tmux-session-switcher<CR>", { silent = true })

-- Normal --
-- Better window navigation. Control + hjkl to move between splits
vim.keymap.set("n", "<C-h>", "<C-w>h", { silent = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { silent = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { silent = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { silent = true })

-- Navigate buffers
vim.keymap.set("n", "<S-l>", ":bnext<CR>", { silent = true })
vim.keymap.set("n", "<S-h>", ":bprevious<CR>", { silent = true })

-- Close buffers
vim.keymap.set("n", "<leader>w", ":Bdelete<cr>", { silent = true }) -- close current buffer. won't quit neovim if it's the only open buffer.
vim.keymap.set("n", "<leader>c", ":Bdelete<cr>", { silent = true }) -- for some reason I feel like I used to have this mapped to leader-c...?
vim.keymap.set("n", "<leader>W", ":bufdo :Bdelete<cr>", { silent = true }) -- close all open buffers, but don't quit neovim.

-- move lines
-- ignore the weird symbols, it's a weird thing with macOS mapping option/alt + key to a symbol.
vim.keymap.set('n', '˙', ":MoveHChar(-1)<CR>", { silent = true })  -- Alt-h
vim.keymap.set('n', '∆', ":MoveLine(1)<CR>", { silent = true })    -- Alt-j
vim.keymap.set('n', '¬', ":MoveHChar(1)<CR>", { silent = true })   -- Alt-l
vim.keymap.set('n', '˚', ":MoveLine(-1)<CR>", { silent = true })   -- Alt-k


-- Visual --
-- Stay in indent mode
vim.keymap.set("v", "<", "<gv", { silent = true })
vim.keymap.set("v", ">", ">gv", { silent = true })

-- Move text up and down
vim.keymap.set('v', '˙', ":MoveHBlock(-1)<CR>", { silent = true }) -- Alt-h
vim.keymap.set('v', '∆', ":MoveBlock(1)<CR>", { silent = true })   -- Alt-j
vim.keymap.set('v', '˚', ":MoveBlock(-1)<CR>", { silent = true })  -- Alt-k
vim.keymap.set('v', '¬', ":MoveHBlock(1)<CR>", { silent = true })  -- Alt-l

-- Visual Block --
-- Move text up and down
vim.keymap.set("x", "J", ":move '>+1<CR>gv-gv", { silent = true })
vim.keymap.set("x", "K", ":move '<-2<CR>gv-gv", { silent = true })
vim.keymap.set("x", "<A-j>", ":move '>+1<CR>gv-gv", { silent = true })
vim.keymap.set("x", "<A-k>", ":move '<-2<CR>gv-gv", { silent = true })
