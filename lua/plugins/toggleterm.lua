return {
	"akinsho/toggleterm.nvim",
	version = "*",
	cmd = "ToggleTerm",
	keys = {
		{ "<M-i>", "<cmd>ToggleTerm direction=float<cr>", desc = "Resize left" },
		{ "<M-v>", "<cmd>ToggleTerm direction=vertical<cr>", desc = "Resize down" },
		{ "<M-h>", "<cmd>ToggleTerm direction=horizontal<cr>", desc = "Resize up" },
	},
	config = function()
		local toggleterm = require("toggleterm")
		toggleterm.setup({
			size = function(term)
				if term.direction == "horizontal" then
					return 15
				elseif term.direction == "vertical" then
					return vim.o.columns * 0.4
				end
			end,
			open_mapping = [[<a-o>]],
			shade_filetypes = { "none" },
			shading_factor = 2,
			direction = "float",
			close_on_exit = true,
			shell = vim.o.shell,
			-- shell = "powershell.exe -NoExit",
			-- shell = "wsl.exe",
			float_opts = {
				border = "curved", -- include: single | double | shadow | curved
				winblend = 0,
				highlights = {
					border = "Normal",
					background = "Normal",
				},
			},
		})

		function _G.set_terminal_keymaps()
			local opts = { buffer = 0 }
			vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
			vim.keymap.set("t", "<c-x>", [[<C-\><C-n>]], opts)
			vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
			vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
			vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
			vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
			vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)
		end
		vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
	end,
}
