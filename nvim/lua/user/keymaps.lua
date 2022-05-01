local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation. Control + hjkl to move between splits
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Toggle explore panel
keymap("n", "<leader>e", ":Ex<cr>", opts)

-- Clear highlight search results
keymap("n", "<leader>ch", ":nohlsearch<cr>", opts)

-- move lines
keymap('n', '˙', ":MoveHChar(-1)<CR>", opts)  -- Alt-h
keymap('n', '∆', ":MoveLine(1)<CR>", opts)    -- Alt-j
keymap('n', '¬', ":MoveHChar(1)<CR>", opts)   -- Alt-l
keymap('n', '˚', ":MoveLine(-1)<CR>", opts)   -- Alt-k

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +5<CR>", opts)
keymap("n", "<C-Down>", ":resize -5<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -5<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +5<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Close buffers
keymap("n", "<leader>w", ":Bdelete<cr>", opts) -- close current buffer. won't quit neovim if it's the only open buffer.
keymap("n", "<leader>W", ":bufdo :Bdelete<cr>", opts) -- close all open buffers, but don't quit neovim.

-- Insert --

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap('v', '˙', ":MoveHBlock(-1)<CR>", opts) -- Alt-h
keymap('v', '∆', ":MoveBlock(1)<CR>", opts)   -- Alt-j
keymap('v', '˚', ":MoveBlock(-1)<CR>", opts)  -- Alt-k
keymap('v', '¬', ":MoveHBlock(1)<CR>", opts)  -- Alt-l

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- Telescope
keymap("n", "<leader>f", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts)
keymap("n", "<c-t>", "<cmd>Telescope live_grep<cr>", opts)
