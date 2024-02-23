return {
	"neovim/nvim-lspconfig",
	event = "BufRead",
	dependencies = {
		"nvimdev/lspsaga.nvim", -- improve neovim lsp experience
		"williamboman/mason-lspconfig.nvim",
	},
	config = function()
		------------------------- variable ------------------------

		local saga = require("lspsaga")
		local lspconfig = require("lspconfig")
		local mason_lspconfig = require("mason-lspconfig")
		local capabilities = require("cmp_nvim_lsp").default_capabilities()
		local signs = {
			Error = " ",
			Warn = " ",
			Hint = "󰠠 ",
			Info = " ",
		}
		local servers = {
			"bashls",
			"clangd",
			"cssls",
			"emmet_ls",
			"html",
			"jdtls",
			"lua_ls",
			"pyright",
			"tailwindcss",
			"tsserver",
		}

		------------------------- lspsaga -------------------------

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
				enable = false,
			},
		})

		-------------------------- mason --------------------------

		mason_lspconfig.setup({
			ensure_installed = servers,
			automatic_installation = true, -- not the same as ensure_installed
		})

		------------------------ lspconfig ------------------------

		-- Change the Diagnostic symbols in the sign column (gutter)
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		-- Config servers
		for _, lsp in ipairs(servers) do
			if lsp == "lua_ls" then
				-- Configure lua server (with special settings)
				lspconfig[lsp].setup({
					capabilities = capabilities,
					settings = {
						Lua = {
							diagnostics = {
								globals = { "vim" },
							},
							workspace = {
								library = {
									[vim.fn.expand("$VIMRUNTIME/lua")] = true,
									[vim.fn.stdpath("config") .. "/lua"] = true,
								},
							},
						},
					},
				})
			elseif lsp == "jdtls" then
				-- Skip because we use mfussenegger/nvim-jdtls
			else
				-- Configure all lsp server with default settings
				lspconfig[lsp].setup({
					-- on_attach = on_attach,
					capabilities = capabilities,
				})
			end
		end
	end,
}
