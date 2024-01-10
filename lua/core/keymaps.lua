vim.g.mapleader = " " -- set leader
vim.g.maplocalleader = " " -- set local leader

-- Utils variable
local keymap = vim.keymap
local opts = { noremap = true, silent = true }

--------------------------------------------- general keymap ------------------------------------------------

-- exit insert mode with jk
keymap.set("i", "jk", "<ESC>", opts)

-- like Visual Studio Code
keymap.set("n", "<S-j>", ":t +0<CR>", opts) -- Shift + j to add the same line
keymap.set("n", "<M-k>", ":m -2<CR>", opts) -- Alt + k to move line up
keymap.set("n", "<M-j>", ":m+<CR>", opts) -- Alt + j to move line down
keymap.set("n", "<C-s>", ":w<CR>", opts) -- save buffer in normal mode
keymap.set("i", "<C-s>", "<ESC>:w<CR>a", opts) -- save buffer in insert mode

-- navigate in insert mode
keymap.set("i", "<C-h>", "<left>", opts)
keymap.set("i", "<C-j>", "<down>", opts)
keymap.set("i", "<C-k>", "<up>", opts)
keymap.set("i", "<C-l>", "<right>", opts)

-- change split window
keymap.set("n", "<C-M-h>", "<C-w>H", opts)
keymap.set("n", "<C-M-J>", "<C-w>J", opts)
keymap.set("n", "<C-M-K>", "<C-w>K", opts)
keymap.set("n", "<C-M-L>", "<C-w>L", opts)

-- copy & paste
keymap.set("n", "<C-A>", "ggVG", opts)
keymap.set("v", "<C-c>", "y", opts)
keymap.set("x", "<C-c>", "y", opts)
keymap.set("n", "<C-v>", "p", opts)
keymap.set("v", "<C-v>", "p", opts)
keymap.set("i", "<C-v>", "<esc>pa", opts)
keymap.set("x", "<C-v>", "p", opts)
keymap.set("n", "<C-z>", "u", opts)
keymap.set("x", "<C-Z>", "<esc><cmd>undo<CR>", opts)
keymap.set("v", "<C-Z>", "<esc><cmd>undo<CR>", opts)
keymap.set("i", "<C-Z>", "<esc><cmd>undo<CR>", opts)

-- stay in indent mode
keymap.set("v", "<", "<gv", opts)
keymap.set("v", ">", ">gv", opts)
