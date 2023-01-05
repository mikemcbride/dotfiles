-- [[ Basic Keymaps ]]
-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

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
vim.keymap.set("n", "<leader>w", ":Bdelete<cr>", { silent = true }) -- close current buffer. won't quit neovim if it's the only open buffer.
vim.keymap.set("n", "<leader>c", ":Bdelete<cr>", { silent = true }) -- for some reason I feel like I used to have this mapped to leader-c...?
vim.keymap.set("n", "<leader>W", ":bufdo :Bdelete<cr>", { silent = true }) -- close all open buffers, but don't quit neovim.

-- move lines
-- ignore the weird symbols, it's a weird thing with macOS mapping option/alt + key to a symbol.
vim.keymap.set('n', '˙', ":MoveHChar(-1)<CR>", { silent = true }) -- Alt-h
vim.keymap.set('n', '∆', ":MoveLine(1)<CR>", { silent = true }) -- Alt-j
vim.keymap.set('n', '¬', ":MoveHChar(1)<CR>", { silent = true }) -- Alt-l
vim.keymap.set('n', '˚', ":MoveLine(-1)<CR>", { silent = true }) -- Alt-k


-- Visual --
-- Stay in indent mode
vim.keymap.set("v", "<", "<gv", { silent = true })
vim.keymap.set("v", ">", ">gv", { silent = true })

-- Move text up and down
vim.keymap.set('v', '˙', ":MoveHBlock(-1)<CR>", { silent = true }) -- Alt-h
vim.keymap.set('v', '∆', ":MoveBlock(1)<CR>", { silent = true }) -- Alt-j
vim.keymap.set('v', '˚', ":MoveBlock(-1)<CR>", { silent = true }) -- Alt-k
vim.keymap.set('v', '¬', ":MoveHBlock(1)<CR>", { silent = true }) -- Alt-l

-- Visual Block --
-- Move text up and down
vim.keymap.set("x", "J", ":move '>+1<CR>gv-gv", { silent = true })
vim.keymap.set("x", "K", ":move '<-2<CR>gv-gv", { silent = true })
vim.keymap.set("x", "<A-j>", ":move '>+1<CR>gv-gv", { silent = true })
vim.keymap.set("x", "<A-k>", ":move '<-2<CR>gv-gv", { silent = true })


--  This function gets run when an LSP connects to a particular buffer.
local on_attach = function(_, bufnr)
  -- We create a function that lets us more easily define mappings specific
  -- for LSP related items. It sets the mode, buffer and description for us each time.
  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end

    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
  nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

  nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
  nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
  nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
  nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
  nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
  nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

  -- See `:help K` for why this keymap
  nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
  nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

  -- Lesser used LSP functionality
  nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
  nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
  nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
  nmap('<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, '[W]orkspace [L]ist Folders')

  -- Create a command `:Format` local to the LSP buffer
  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    vim.lsp.buf.format()
  end, { desc = 'Format current buffer with LSP' })
end
