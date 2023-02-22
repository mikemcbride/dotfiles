-- [[ Basic Keymaps ]]

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Telescope
vim.keymap.set('n', '<leader>f', require('telescope.builtin').find_files, { desc = 'Search [F]iles' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').git_files, { desc = '[S]earch [G]it Files' })

-- Formatting
vim.keymap.set('n', '<leader>F', ':LspZeroFormat<Cr>', { silent = true })

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
vim.keymap.set("n", "<leader>bd", ":Bdelete<cr>", { silent = true }) -- close current buffer. won't quit neovim if it's the only open buffer.
vim.keymap.set("n", "<leader>bD", ":bufdo :Bdelete<cr>", { silent = true }) -- close all open buffers, but don't quit neovim.


-- Visual --
-- Stay in indent mode
vim.keymap.set("v", "<", "<gv", { silent = true })
vim.keymap.set("v", ">", ">gv", { silent = true })


-- [[ Move Lines plugin ]] --
-- ignore the weird symbols, it's a weird thing with macOS mapping option/alt + key to a symbol.

-- normal mode
vim.keymap.set('n', '˙', ":MoveHChar(-1)<CR>", { silent = true }) -- Alt-h
vim.keymap.set('n', '∆', ":MoveLine(1)<CR>", { silent = true }) -- Alt-j
vim.keymap.set('n', '¬', ":MoveHChar(1)<CR>", { silent = true }) -- Alt-l
vim.keymap.set('n', '˚', ":MoveLine(-1)<CR>", { silent = true }) -- Alt-k

-- visual mode
vim.keymap.set('v', '˙', ":MoveHBlock(-1)<CR>", { silent = true }) -- Alt-h
vim.keymap.set('v', '∆', ":MoveBlock(1)<CR>", { silent = true }) -- Alt-j
vim.keymap.set('v', '˚', ":MoveBlock(-1)<CR>", { silent = true }) -- Alt-k
vim.keymap.set('v', '¬', ":MoveHBlock(1)<CR>", { silent = true }) -- Alt-l

-- visual block mode
vim.keymap.set("x", "J", ":move '>+1<CR>gv-gv", { silent = true })
vim.keymap.set("x", "K", ":move '<-2<CR>gv-gv", { silent = true })
vim.keymap.set("x", "<A-j>", ":move '>+1<CR>gv-gv", { silent = true })
vim.keymap.set("x", "<A-k>", ":move '<-2<CR>gv-gv", { silent = true })


