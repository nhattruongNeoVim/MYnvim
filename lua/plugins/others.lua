return {
	{
		"nvim-tree/nvim-web-devicons", -- Files icons
	},
	{
		"christoomey/vim-tmux-navigator", -- cho phép di chuyển giữa các split windows
		event = "VimEnter",
	},
	{
		"szw/vim-maximizer", -- maximal/minimal split windows
		event = "VimEnter",
	},
	{
		"karb94/neoscroll.nvim", -- smooth scroll
		event = "VimEnter",
		config = true,
	},
	{
		"NvChad/nvim-colorizer.lua", -- colorize
		event = { "BufReadPre", "BufNewFile" },
		config = true,
	},
	{
		"windwp/nvim-autopairs", -- auto pairs
		event = { "InsertEnter" },
		config = true,
	},
	{
		"kylechui/nvim-surround", -- Surround selections, stylishly 😎
		event = { "VeryLazy" },
		version = "*",
		config = true,
	},
	{
		"stevearc/dressing.nvim", -- Improve the default vim.ui interfaces
		event = "VeryLazy",
	},
}
