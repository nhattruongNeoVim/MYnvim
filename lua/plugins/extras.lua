return {
	{ "nvim-lua/plenary.nvim" }, -- Library used by other plugins ( Very Important! )
	{
		"stevearc/dressing.nvim", -- Improve the default vim.ui interfaces
		event = "VeryLazy",
	},
	{
		"christoomey/vim-tmux-navigator", -- Allow navigator between split windows
		event = "VimEnter",
	},
	{
		"szw/vim-maximizer", -- Maximal/minimal split windows
		cmd = "MaximizerToggle",
	},
	{
		"famiu/bufdelete.nvim", -- Delete Neovim buffers without losing window layout
		cmd = "Bdelete",
	},
	{
		"karb94/neoscroll.nvim", -- Smooth scroll
		keys = { { "<C-u>" }, { "<C-d>" }, { "<C-b>" }, { "<C-f>" }, { "zz" }, { "zb" }, { "zt" } },
		config = true,
	},
	{
		"phaazon/hop.nvim", -- Neovim motions on speed!
		cmd = { "HopWord", "HopAnywhere", "HopChar1", "HopLine", "HopLineStart", "HopPattern" },
		config = true,
	},
	{
		"NvChad/nvim-colorizer.lua", -- Colorize
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
		"iamcco/markdown-preview.nvim", -- Markdown-preview
		ft = { "markdown" },
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
	},
	{
		"Wansmer/treesj", -- Splitting/joining blocks of code
		keys = {
			{ "H", "<cmd>TSJToggle<cr>", desc = "Join Toggle" },
		},
		opts = { use_default_keymaps = false, max_join_length = 150 },
	},
	{
		"mrjones2014/smart-splits.nvim", -- Navigation and resizing of Neovim + terminal multiplexer splits
		keys = {
			{ "<M-a>", "<cmd>SmartResizeLeft<cr>", desc = "Resize left" },
			{ "<M-s>", "<cmd>SmartResizeDown<cr>", desc = "Resize down" },
			{ "<M-w>", "<cmd>SmartResizeUp<cr>", desc = "Resize up" },
			{ "<M-d>", "<cmd>SmartResizeRight<cr>", desc = "Resize right" },
		},
	},
	{
		"folke/todo-comments.nvim",
		event = "BufRead",
		config = true,
		-- WARN:
		-- HACK:
		-- TODO:
		-- PERF:
		-- NOTE:
		-- TEST:
		-- FIX:
	},
}
