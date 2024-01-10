return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"nvimdev/lspsaga.nvim", -- improve neovim lsp experience (Optional)
	},
	config = function()
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
				enable = false, -- toggle breadcrumb
				separator = " ",
				ignore_patterns = {},
				hide_keyword = true,
				show_file = true,
				folder_level = 2,
				respect_root = false,
				color_mode = true,
			},
		})

		local lspconfig = require("lspconfig")
		local capabilities = require("cmp_nvim_lsp").default_capabilities()
		local signs = {
			Error = " ",
			Warn = " ",
			Hint = "󰠠 ",
			Info = " ",
		}
		local servers = {
			"html",
			"cssls",
			"clangd",
			"tsserver",
			"tailwindcss",
			"emmet_ls",
			"pyright",
			"clangd",
		}

		-- Change the Diagnostic symbols in the sign column (gutter)
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		-- Configure all lsp server with default settings
		for _, lsp in ipairs(servers) do
			lspconfig[lsp].setup({
				-- on_attach = on_attach,
				capabilities = capabilities,
			})
		end

		-- Configure lua server (with special settings)
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
	end,
}
