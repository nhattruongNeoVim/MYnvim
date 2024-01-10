local opt = vim.opt

-- numberline
opt.relativenumber = true
opt.number = true

-- tab & indent
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true

-- wrap text
opt.wrap = false

-- cài đặt tìm kiếm
opt.ignorecase = true
opt.smartcase = true

-- cursor line (đánh dấu dòng kẻ tại vị trí con trỏ)
opt.cursorline = false

-- set termguicolors to enable highlight groups
opt.termguicolors = true

opt.background = "dark"
opt.signcolumn = "yes"

-- backspace
opt.backspace = "indent,eol,start"

-- clipboard
opt.clipboard:append("unnamedplus")

-- split window
opt.splitright = true
opt.splitbelow = true

-- delete ~ on empty line
opt.fillchars = { eob = " " }

-- font in neovim-qt
opt.guifont = "MesloLGS NF:h10"

-- more space in the neovim command line for displaying messages
opt.cmdheight = 2

opt.mousemoveevent = true
opt.iskeyword:append("-")

opt.showtabline = 2
opt.showmode = false

opt.sidescrolloff = 8

-- Tự động cập nhật nội dung file khi bị thay đổi từ bên ngoài
vim.cmd([[au FocusGained,BufEnter,BufRead * checktime]])
vim.loader.enable()
