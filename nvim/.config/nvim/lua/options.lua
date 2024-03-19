-- [[ Setting options ]]
-- See `:help vim.o`

-- Set highlight on search
vim.o.hlsearch = false

-- Make line numbers default
vim.wo.number = true

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Decrease update time
vim.o.updatetime = 250

-- Set colorscheme
vim.o.termguicolors = true
vim.opt.background = "dark"

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- creates a backup file
vim.o.backup = false

-- allows neovim to access the system clipboard
vim.o.clipboard = "unnamedplus"

-- set the height of the command line to 1 row
vim.o.cmdheight = 1

-- so that `` is visible in markdown files
vim.o.conceallevel = 0

-- the encoding written to a file
vim.o.fileencoding = "utf-8"

-- never allow the mouse to be used in neovim
vim.o.mouse = ""

-- disable the indent guide/ruler
vim.o.ruler = false

-- pop up menu height
vim.o.pumheight = 10

-- we don't need to see things like -- INSERT -- anymore
vim.o.showmode = false

-- never show tabs
vim.o.showtabline = 0

-- make indenting smarter again
vim.o.smartindent = true

-- force all horizontal splits to go below current window
vim.o.splitbelow = true

-- force all vertical splits to go to the right of current window
vim.o.splitright = true

-- creates a swapfile
vim.o.swapfile = false

-- time to wait for a mapped sequence to complete (in milliseconds)
vim.o.timeoutlen = 500

-- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
vim.o.writebackup = false

-- 4 space tabs
vim.o.tabstop = 4
vim.o.shiftwidth = 4

-- convert tabs to spaces
vim.o.expandtab = true

-- highlight the current line
vim.o.cursorline = false

-- set numbered lines
vim.o.number = true

-- set relative numbered lines
vim.o.relativenumber = true

-- set number column width to 4
vim.o.numberwidth = 4

-- always show the sign column, otherwise it would shift the text each time
vim.o.signcolumn = "yes"

-- wrap text
vim.o.wrap = true

-- show a wrap guide at 120 characters
-- vim.wo.colorcolumn = "120"

-- start scrolling when you are this many lines from the bottom/top of the screen
vim.o.scrolloff = 8

-- start scrolling when you are this many columns from the left/right of the screen
vim.o.sidescrolloff = 8

