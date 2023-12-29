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
		-- import mason
		local mason = require("mason")

		local mason_lsp_installer = require("mason-lspconfig")

		local mason_other_installer = require("mason-null-ls")

		-- enable mason and configure icons
		mason.setup({
			ui = {
				border = "none",
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		mason_lsp_installer.setup({
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

		mason_other_installer.setup({
			ensure_installed = {
				"clang_format", -- c++ formatter
				"codelldb", -- C++ debugger
				"black", -- python formatter
				"isort", -- python formatter
				"pylint", -- python linter
				"prettier", -- prettier formatter
				"stylua", -- lua formatter
				"eslint_d", -- js linter
				"debugpy", -- Python debugger
                "shfmt", -- sh formatter
			},
			automatic_installation = true,
		})
	end,
}
