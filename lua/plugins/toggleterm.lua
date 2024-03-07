return {
	"akinsho/toggleterm.nvim",
	version = "*",
	keys = {
		{ mode = { "n", "t" }, "<M-f>", "<cmd>ToggleTerm direction=float<cr>", desc = "float terminal" },
		{ mode = { "n", "t" }, "<M-h>", "<cmd>ToggleTerm direction=vertical<cr>", desc = "vertical terminal" },
		{ mode = { "n", "t" }, "<M-v>", "<cmd>ToggleTerm direction=horizontal<cr>", desc = "horizontal terminal" },
		{ mode = { "n", "t" }, "<M-o>", desc = "toggle term" },
	},
	config = function()
		require("toggleterm").setup({
			size = function(term)
				if term.direction == "horizontal" then
					return 15
				elseif term.direction == "vertical" then
					return vim.o.columns * 0.4
				end
			end,
			open_mapping = [[<M-o>]],
			shade_filetypes = { "none" },
			shading_factor = 2,
			direction = "float",
			close_on_exit = true,
			shell = vim.o.shell,
			float_opts = {
				border = "curved", -- include: single | double | shadow | curved
				winblend = 0,
			},
			highlights = {
				FloatBorder = {
					guifg = "#9d7cd8",
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
