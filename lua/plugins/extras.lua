return {
	{ "nvim-lua/plenary.nvim" }, -- Library used by other plugins ( Very Important! )
	{
		"stevearc/dressing.nvim", -- Improve the default vim.ui interfaces
		event = "VeryLazy",
	},
	{
		"mg979/vim-visual-multi", -- multiple cursors plugin for vim/neovim
		event = "VeryLazy",
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
		"uga-rosa/ccc.nvim", -- Color picker
		cmd = "CccPick",
        config = true,
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
		opts = { use_default_keymaps = false, max_join_length = 300 },
	},
}
