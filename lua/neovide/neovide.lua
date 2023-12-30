-- Config for Neovide
local is_neovide = true
local use_noice = false
vim.o.guifont = "MesloLGS NF:h10"
vim.g.neovide_padding_top = 0
vim.g.neovide_padding_bottom = 0
vim.g.neovide_padding_right = 0
vim.g.neovide_padding_left = 0
vim.g.neovide_transparency = 0.9
vim.g.transparency = 0.8
vim.opt.linespace = 0
vim.g.neovide_cursor_vfx_mode = "railgun"
vim.g.neovide_input_use_logo = 1
vim.keymap.set("v", "<c-c>", '"+y') -- Copy
vim.keymap.set("n", "<c-v>", '"+P') -- Paste normal mode
vim.keymap.set("v", "<c-v>", '"+P') -- Paste visual mode
vim.keymap.set("c", "<c-v>", "<C-R>+") -- Paste command mode
vim.keymap.set("i", "<c-v>", "<C-R>+") -- Paste insert mode
vim.keymap.set("t", "<c-v>", '<c-\\><c-n>"+Pa') -- Paste terminal mode
vim.opt.cmdheight = 0
