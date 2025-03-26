vim.g.mapleader = " "

local keymap = vim.keymap
local builtin = require("telescope.builtin")

-- Source Config Files --
keymap.set("n", "<leader><CR>", "<cmd>lua ReloadConfig()<CR>") -- broken?

-- General Keymaps --
keymap.set("n", "<leader>c/", ":noh<CR>")       -- clear serach word 
keymap.set("n", "<leader>mw", "<C-w>|<C-w>_")   -- maximize window

-- Window Management --
keymap.set("n", "<leader>sv", "<C-w>v")         -- Split window vertically
keymap.set("n", "<leader>sh", "<C-w>s")         -- Split window horizontally
keymap.set("n", "<leader>se", "<C-w>=")         -- Make split windows equal width & height
keymap.set("n", "<leader>sx", ":close<CR>")     -- Close current split window

keymap.set("n", "<leader>to", ":tabnew<CR>")    -- Open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>")  -- Close current tab
keymap.set("n", "<leader>tn", ":tabn<CR>")      -- Go to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>")      -- Go to previous tab

-- Diagnostics --
keymap.set('n', '[d', vim.diagnostic.goto_prev)
keymap.set('n', ']d', vim.diagnostic.goto_next)
keymap.set('n', '<space>q', vim.diagnostic.setloclist)
keymap.set('n', '<leader>ce', vim.diagnostic.open_float)

-- Code Actions --
keymap.set("n", "<leader>ca", require("actions-preview").code_actions)

-- Documentation --
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = "Go to Definition" })
vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = "Hover Documentation" })

-- nvim-tree Explorer --
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>") -- open tree explorer
keymap.set("n", "<leader>tc", ":NvimTreeCollapse<CR>") -- collapse tree explorer

-- Telescope Fuzzy Finder --
keymap.set("n", "<leader>ff", builtin.find_files)
keymap.set("n", "<leader>fg", builtin.live_grep)
keymap.set("n", "<leader>fs", builtin.grep_string)
keymap.set("n", "<leader>fb", builtin.buffers)
keymap.set("n", "<leader>fh", builtin.help_tags)

-- Indentation --
keymap.set("n", "<leader>gi", ":Indent<CR>")

-- LeetCode --
keymap.set("n", "<leader>lm", ":Leet menu<CR>")
keymap.set("n", "<leader>ll", ":Leet list<CR>")
keymap.set("n", "<leader>lt", ":Leet test<CR>")
keymap.set("n", "<leader>ls", ":Leet submit<CR>")
