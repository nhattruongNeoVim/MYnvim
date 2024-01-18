return {
	"williamboman/mason.nvim",
	event = "VimEnter",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		{
			"jay-babu/mason-null-ls.nvim",
			dependencies = "nvimtools/none-ls.nvim",
		},
	},
	config = function()
		local mason = require("mason")
		local lsp_installer = require("mason-lspconfig")
		local other_installer = require("mason-null-ls")

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

		lsp_installer.setup({
			ensure_installed = {
				"tsserver",
				"html",
				"cssls",
				"tailwindcss",
				"lua_ls",
				"emmet_ls",
				"pyright",
				"clangd",
				"jdtls",
			},
			automatic_installation = true, -- not the same as ensure_installed
		})

		other_installer.setup({
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
