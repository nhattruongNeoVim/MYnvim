return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{ "antosha417/nvim-lsp-file-operations", config = true },
		{
			"nvimdev/lspsaga.nvim",
			dependencies = {
				"nvim-treesitter/nvim-treesitter", -- optional
				"nvim-tree/nvim-web-devicons", -- optional
			},
		},
	},
	config = function()
		-- import lspsaga
		local saga = require("lspsaga")

		saga.setup({
			use_saga_diagnostic_sign = false,
			error_sign = false,
			scroll_preview = { scroll_down = "<C-f>", scroll_up = "<C-b>" },
			definition = {
				edit = "<CR>",
			},
			ui = {
				title = true,
				border = "rounded",
				winblend = 0,
				expand = "",
				collapse = "",
				code_action = "💡",
				incoming = " ",
				outgoing = " ",
				hover = " ",
				kind = {},
			},
			lightbulb = {
				enable = false,
				enable_in_insert = true,
				sign = true,
				sign_priority = 40,
				virtual_text = true,
			},
			symbol_in_winbar = {
				enable = false, -- bật tắt thanh breadcrumb
				separator = " ",
				ignore_patterns = {},
				hide_keyword = true,
				show_file = true,
				folder_level = 2,
				respect_root = false,
				color_mode = true,
			},
		})

		-- import lspconfig plugin
		local lspconfig = require("lspconfig")

		-- import cmp-nvim-lsp plugin
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		-- used to enable autocompletion (assign to every lsp server config)
		local capabilities = cmp_nvim_lsp.default_capabilities()

		-- Change the Diagnostic symbols in the sign column (gutter)
		local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		-- configure html server
		lspconfig["html"].setup({
			capabilities = capabilities,
		})

		-- configure typescript server with plugin
		lspconfig["tsserver"].setup({
			capabilities = capabilities,
		})

		-- configure css server
		lspconfig["cssls"].setup({
			capabilities = capabilities,
		})

		-- configure tailwindcss server
		lspconfig["tailwindcss"].setup({
			capabilities = capabilities,
		})

		-- configure emmet language server
		lspconfig["emmet_ls"].setup({
			capabilities = capabilities,
			filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
		})

		-- configure python server
		lspconfig["pyright"].setup({
			capabilities = capabilities,
		})

		-- configure lua server (with special settings)
		lspconfig["lua_ls"].setup({
			capabilities = capabilities,
			settings = { -- custom settings for lua
				Lua = {
					-- make the language server recognize "vim" global
					diagnostics = {
						globals = { "vim" },
					},
					workspace = {
						-- make language server aware of runtime files
						library = {
							[vim.fn.expand("$VIMRUNTIME/lua")] = true,
							[vim.fn.stdpath("config") .. "/lua"] = true,
						},
					},
				},
			},
		})

		-- Configure cpp server
		lspconfig["clangd"].setup({
			capabilities = capabilities,
			cmd = { "clangd", "--background-index" }, -- Lệnh để chạy clangd
			filetypes = { "c", "cpp" }, -- Các loại tệp tin được hỗ trợ (có thể thay đổi tùy theo nhu cầu)
			root_dir = lspconfig.util.root_pattern( -- Xác định thư mục gốc cho dự án
				".git",
				"compile_commands.json",
				".clangd",
				".clang-format",
				".clang-tidy",
				"compile_flags.txt",
				"configure.ac"
			),
		})

		-- lspconfig["jdtls"].setup({
		-- 	cmd = { "jdtls" },
		-- 	capabilities = capabilities,
		-- 	filetypes = { "java" },
		-- 	-- root_dir = vim.fs.dirname(vim.fs.find({'gradlew', '.git', 'mvnw'}, { upward = true })[1]),
		-- 	root_dir = lspconfig.util.root_pattern(".git", "*.iml", "mvnw", "gradlew"),
		-- })
	end,
}
