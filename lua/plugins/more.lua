return {
	{
		"nvim-tree/nvim-web-devicons", -- Files icons
	},
	{
		"stevearc/dressing.nvim", -- Improve the default vim.ui interfaces
		event = "VeryLazy",
	},
	{
		"christoomey/vim-tmux-navigator", -- cho phép di chuyển giữa các split windows
		event = "VimEnter",
	},
	{
		"szw/vim-maximizer", -- Maximal/minimal split windows
		event = "VimEnter",
	},
	{
		"karb94/neoscroll.nvim", -- Smooth scroll
		event = "VimEnter",
		config = true,
	},
	{
		"NvChad/nvim-colorizer.lua", -- Colorize
		event = { "BufReadPre", "BufNewFile" },
		config = true,
	},
	{
		"windwp/nvim-autopairs", -- Auto pairs
		event = { "InsertEnter" },
		config = true,
	},
	{
		"phaazon/hop.nvim", -- Neovim motions on speed!
		event = { "BufReadPre", "BufNewFile" },
		config = true,
	},
	{
		"kylechui/nvim-surround", -- Surround selections, stylishly 😎
		event = { "VeryLazy" },
		version = "*",
		config = true,
	},
	{
		"Wansmer/treesj", -- Splitting/joining blocks of code
		keys = {
            "H",
            "<cmd>TSJToggle<cr>",
            desc = "Join Toggle",
        },
		opts = {
            use_default_keymaps = false,
            max_join_length = 150,
        },
	},
}
