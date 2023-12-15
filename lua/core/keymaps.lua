vim.g.mapleader = " "                                    -- set leader

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

--------------------------------------------- general keymap ------------------------------------------------

-- thoát nhanh khỏi chế độ insert bằng hj, ngoài ra cũng có thể thoát nhanh bằng Alt + h,j,k,l
keymap.set("i", "hj", "<ESC>",                  opts)

-- buffer
keymap.set("n", "<C-s>", ":w<CR>",              opts)    -- lưu buffer trong normal mode
keymap.set("i", "<C-s>", "<ESC>:w<CR>a",        opts)    -- lưu buffer trong insert mode

-- tăng giảm số hạng 
keymap.set("n", "<leader>+", "<C-a>")
keymap.set("n", "<leader>-", "<C-x")

-- tab 
keymap.set("n", "<leader>to", ":tabnew<CR>",    opts)    -- mở tab mới
keymap.set("n", "<leader>tx", ":tabclose<CR>",  opts)    -- đóng tab hiện tại

-- thao tác với hàng như Visual Studio Code
keymap.set("n", "<S-j>", ":t +0<CR>",           opts)    -- Shift + j để coppy hàng và tạo hàng bên dưới
keymap.set("n", "<M-j>", ":m+<CR>",             opts)    -- Alt + j để di chuyển hàng xuống
keymap.set("n", "<M-k>", ":m -2<CR>",           opts)    -- Alt + k để di chuyển hàng lên

-- giữ ctrl + h,j,k,l để di chuyển trong insert mode
keymap.set("i", "<C-h>", "<left>",              opts)
keymap.set("i", "<C-j>", "<down>",              opts)
keymap.set("i", "<C-k>", "<up>",                opts)
keymap.set("i", "<C-l>", "<right>",             opts)

-- ngắt dòng văn bản trong neovim
keymap.set("n", "<M-z>", ":set wrap<CR>",       opts)
keymap.set("n", "<M-x>", ":set nowrap<CR>",     opts)

-- format code Ctrl + f
keymap.set("n", "<C-f>", ":lua vim.lsp.buf.format{async=true}<CR>", opts)

-- open terminal
keymap.set("n", "<M-i>", ":ToggleTerm direction=float<CR>",         opts)
keymap.set("n", "<M-v>", ":ToggleTerm direction=vertical<CR>",      opts)
keymap.set("n", "<M-h>", ":ToggleTerm direction=horizontal<CR>",    opts)

-- đổi chỗ split window
keymap.set("n", "<C-M-h>", "<C-w>H",    opts)
keymap.set("n", "<C-M-J>", "<C-w>J",    opts)
keymap.set("n", "<C-M-K>", "<C-w>K",    opts)
keymap.set("n", "<C-M-L>", "<C-w>L",    opts)

---------------------------------------------- plugin keymap ------------------------------------------------

-- vim-maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>",               opts)

-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>",                 opts)

-- bufferline
keymap.set("n", "<tab>", ":BufferLineCycleNext<CR>",                opts)
keymap.set("n", "<S-tab>", ":BufferLineCyclePrev<CR>",              opts)

-- bật live-server
keymap.set("n", "<C-k>l", ":LiveServer start<CR>",                  opts)

-- smart-split
keymap.set("n", "<M-a>", ":SmartResizeLeft<CR>",                    opts)
keymap.set("n", "<M-s>", ":SmartResizeDown<CR>",                    opts)
keymap.set("n", "<M-w>", ":SmartResizeUp<CR>",                      opts)
keymap.set("n", "<M-d>", ":SmartResizeRight<CR>",                   opts)

-- keymap.set("n", "<C-M-h>", ":SmartResizeLeft<CR>",                 opts)
-- keymap.set("n", "<C-M-j>", ":SmartResizeDown<CR>",                 opts)
-- keymap.set("n", "<C-M-k>", ":SmartResizeUp<CR>",                   opts)
-- keymap.set("n", "<C-M-l>", ":SmartResizeRight<CR>",                opts)
