return {
	"akinsho/toggleterm.nvim",
	version = "*",
	event = "VimEnter",
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
			hide_numbers = true,
			shade_filetypes = { "none" },
			shade_terminals = true,
			shading_factor = 2,
			start_in_insert = true,
			insert_mappings = true,
			persist_size = true,
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

		-- if you only want these mappings for toggle term use term://*toggleterm#* instead
		vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
		vim.keymap.set("n", "<M-i>", ":ToggleTerm direction=float<CR>", { noremap = true, silent = true })
		vim.keymap.set("n", "<M-v>", ":ToggleTerm direction=vertical<CR>", { noremap = true, silent = true })
		vim.keymap.set("n", "<M-h>", ":ToggleTerm direction=horizontal<CR>", { noremap = true, silent = true })
	end,
}
