vim.g.mapleader = " " -- set leader

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

--------------------------------------------- general keymap ------------------------------------------------

-- thoát nhanh khỏi chế độ insert bằng hj, ngoài ra cũng có thể thoát nhanh bằng Alt + h,j,k,l
keymap.set("i", "hj", "<ESC>", opts)

-- buffer
keymap.set("n", "<C-s>", ":w<CR>", opts) -- lưu buffer trong normal mode
keymap.set("i", "<C-s>", "<ESC>:w<CR>a", opts) -- lưu buffer trong insert mode

-- thao tác với hàng như Visual Studio Code
keymap.set("n", "<S-j>", ":t +0<CR>", opts) -- Shift + j để coppy hàng và tạo hàng bên dưới
keymap.set("n", "<M-j>", ":m+<CR>", opts) -- Alt + j để di chuyển hàng xuống
keymap.set("n", "<M-k>", ":m -2<CR>", opts) -- Alt + k để di chuyển hàng lên

-- giữ ctrl + h,j,k,l để di chuyển trong insert mode
keymap.set("i", "<C-h>", "<left>", opts)
keymap.set("i", "<C-j>", "<down>", opts)
keymap.set("i", "<C-k>", "<up>", opts)
keymap.set("i", "<C-l>", "<right>", opts)

-- đổi chỗ split window
keymap.set("n", "<C-M-h>", "<C-w>H", opts)
keymap.set("n", "<C-M-J>", "<C-w>J", opts)
keymap.set("n", "<C-M-K>", "<C-w>K", opts)
keymap.set("n", "<C-M-L>", "<C-w>L", opts)
