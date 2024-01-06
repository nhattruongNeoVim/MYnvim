return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPost", "BufNewFile" },
	build = ":TSUpdate",
	dependencies = {
		"windwp/nvim-ts-autotag", -- Autoclose and autorename html tag
	},
	config = function()
		local treesitter = require("nvim-treesitter.configs")

		treesitter.setup({
			highlight = {
				enable = true, -- enable syntax highlighting
				disable = { "css", "markdown" },
			},
			indent = { enable = true }, -- enable indentation
			autotag = { enable = true }, -- enable autotagging with với nvim-ts-autotag plugin
			ensure_installed = { -- put the language you want install in this array
				"json",
				"javascript",
				"typescript",
				"tsx",
				"yaml",
				"java",
				"html",
				"bash",
				"lua",
				"vim",
				"dockerfile",
				"gitignore",
				"query",
				"cpp",
			},
			auto_install = true, -- make sure there languages will install
		})
	end,
}
