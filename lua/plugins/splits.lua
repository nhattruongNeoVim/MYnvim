return {
	"mrjones2014/smart-splits.nvim",
	event = "VimEnter",
	config = function()
		local keymap = vim.keymap
		local opts = { noremap = true, silent = true }

		keymap.set("n", "<M-a>", ":SmartResizeLeft<CR>", opts)
		keymap.set("n", "<M-s>", ":SmartResizeDown<CR>", opts)
		keymap.set("n", "<M-w>", ":SmartResizeUp<CR>", opts)
		keymap.set("n", "<M-d>", ":SmartResizeRight<CR>", opts)
	end,
}
