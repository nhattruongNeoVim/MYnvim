vim.g.mapleader = " "      -- set leader
vim.g.maplocalleader = " " -- set local leader

-- Utils variable
local set = vim.keymap.set
local opts = { noremap = true, silent = true }

--------------------------------------------- general keymap ------------------------------------------------
-- exit insert mode
set("i", "jk", "<ESC>", opts)

-- like Visual Studio Code
set("n", "<S-j>", ":t +0<CR>", opts)  --> Shift + j to add the same line
set("n", "<M-k>", ":m -2<CR>", opts)  --> Alt + k to move line up
set("n", "<M-j>", ":m+<CR>", opts)    --> Alt + j to move line down
set("n", "<C-s>", "<cmd>w<CR>", opts) --> save buffer in normal mode
set("i", "<C-s>", "<cmd>w<CR>", opts) --> save buffer in insert mode

-- navigate in insert mode
set("i", "<C-h>", "<left>", opts)
set("i", "<C-j>", "<down>", opts)
set("i", "<C-k>", "<up>", opts)
set("i", "<C-l>", "<right>", opts)

-- change split window
set("n", "<leader><leader>h", "<C-w>H", opts)
set("n", "<leader><leader>j", "<C-w>J", opts)
set("n", "<leader><leader>k", "<C-w>K", opts)
set("n", "<leader><leader>l", "<C-w>L", opts)

-- copy & paste
set("n", "<C-A>", "ggVG", opts)
set("v", "<C-c>", "y", opts)
set("x", "<C-c>", "y", opts)
set("n", "<C-v>", "p", opts)
set("v", "<C-v>", "p", opts)
set("i", "<C-v>", "<esc>pa", opts)
set("x", "<C-v>", "p", opts)
set("n", "<C-z>", "u", opts)
set("x", "<C-Z>", "<esc><cmd>undo<CR>", opts)
set("v", "<C-Z>", "<esc><cmd>undo<CR>", opts)
set("i", "<C-Z>", "<esc><cmd>undo<CR>", opts)

-- stay in indent mode
set("v", "<", "<gv", opts)
set("v", ">", ">gv", opts)
