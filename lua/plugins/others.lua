return {
	{
		"christoomey/vim-tmux-navigator", -- cho phép di chuyển giữa các split windows
		event = "VimEnter",
	},
	{
		"szw/vim-maximizer", -- maximal/minimal split windows
		event = "VimEnter",
	},
	{
		"moll/vim-bbye",
		event = "VimEnter",
	},
	{
		"karb94/neoscroll.nvim",
		event = "VimEnter",
		config = function()
			require("neoscroll").setup({})
		end,
	},
	{
		"NvChad/nvim-colorizer.lua",
		event = { "BufReadPre", "BufNewFile" },
		config = true,
	},
	-- {
	-- 	"xiyaowong/nvim-transparent",
	-- 	event = "VimEnter",
	-- },
}
