return {
	"williamboman/mason.nvim",
	-- event = "VeryLazy",
    cmd = "Mason",
	dependencies = {
		"jay-babu/mason-null-ls.nvim",
		"nvimtools/none-ls.nvim",
	},
	config = function()
		local mason = require("mason")
		local installer = require("mason-null-ls")

		-- setup mason
		mason.setup({
			ui = {
				border = "rounded",
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		installer.setup({
			ensure_installed = {
				"clang_format", -- c++ formatter
				"black", -- python formatter
				"isort", -- python formatter
				"pylint", -- python linter
				"prettier", -- prettier formatter
				"stylua", -- lua formatter
				"eslint_d", -- js linter
				"shfmt", -- sh formatter
				"bash-debug-adapter", -- bash debugger
			},
			automatic_installation = true,
		})
	end,
}
