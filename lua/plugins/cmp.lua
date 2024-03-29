return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		-- Soure for cmp
		"hrsh7th/cmp-nvim-lsp", -- source for lsp
		"hrsh7th/cmp-buffer", -- source for text in buffer
		"hrsh7th/cmp-path", -- source for file system paths
		"hrsh7th/cmp-nvim-lua", -- source for cmp
		"saadparwaiz1/cmp_luasnip", -- source for LuaSnip autocompletion
		{
			"tzachar/cmp-tabnine", -- source from AI
			build = "./install.sh",
		},

		-- snippet engine
		{
			"L3MON4D3/LuaSnip",
			version = "v2.*",
			build = "make install_jsregexp",
			dependencies = {
				"rafamadriz/friendly-snippets",
				-- "onsails/lspkind.nvim", -- vs-code like pictograms
			},
		},
	},
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")
		local lpath = vim.fn.stdpath("config") .. "/snippets"

		cmp.setup({
			completion = {
				completeopt = "menu,preview,menuone,noselect",
			},
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<S-tab>"] = cmp.mapping.select_prev_item(), -- previous suggestion
				["<tab>"] = cmp.mapping.select_next_item(), -- next suggestion
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
				["<C-e>"] = cmp.mapping.abort(), -- close completion window
				["<CR>"] = cmp.mapping.confirm({ select = false }),
			}),
			-- sources for autocompletion
			sources = cmp.config.sources({
				{ name = "cmp_tabnine" }, -- tabnine
				{ name = "nvim_lsp" }, -- lsp
				{ name = "nvim_lua" }, -- lsp
				{ name = "luasnip" }, -- snippets
				{ name = "buffer" }, -- text within current buffer
				{ name = "path" }, -- file system paths
			}),
			formatting = {
				fields = { "kind", "abbr", "menu" },
				format = function(entry, vim_item)
					vim_item.kind = string.format("%s", require("core.icons")["kind"][vim_item.kind])
					-- vim_item.kind = require("lspkind").symbolic(vim_item.kind, { mode = "symbol" })
					vim_item.menu = ({
						luasnip = "[Snippet]",
						cmp_tabnine = "[TB]",
						buffer = "[Buffer]",
						nvim_lsp = "[LSP]",
						path = "[Path]",
					})[entry.source.name]

					if entry.source.name == "cmp_tabnine" then
						-- vim_item.kind = ""
						vim_item.kind = " "
					end

					local maxwidth = 80
					vim_item.abbr = string.sub(vim_item.abbr, 1, maxwidth)
					return vim_item
				end,
			},
			window = {
				completion = cmp.config.window.bordered({
					scrollbar = false,
				}),
				documentation = cmp.config.window.bordered({
					scrollbar = false,
				}),
			},
		})

		-- specify the full path...
		require("luasnip.loaders.from_vscode").lazy_load()

		-- custom snippets
		require("luasnip.loaders.from_vscode").lazy_load({ paths = lpath .. "/B5-Snippets" })
		require("luasnip.loaders.from_vscode").lazy_load({ paths = lpath .. "/laravel-blade" })
		require("luasnip.loaders.from_vscode").lazy_load({ paths = lpath .. "/laravel-blade2" })
		require("luasnip.loaders.from_vscode").lazy_load({ paths = lpath .. "/laravel5" })
		require("luasnip.loaders.from_vscode").lazy_load({ paths = lpath .. "/javascript" })
		require("luasnip.loaders.from_vscode").lazy_load({ paths = lpath .. "/html" })
		require("luasnip.loaders.from_vscode").lazy_load({ paths = lpath .. "/javascript-snippet" })
		require("luasnip.loaders.from_vscode").lazy_load({ paths = lpath .. "/codeigniter4" })
		require("luasnip.loaders.from_vscode").lazy_load({ paths = lpath .. "/font-awesome" })

		--require("luasnip.loaders.from_vscode").load({ paths = lpath .. "/B5-Snippets" })
		--require("luasnip.loaders.from_vscode").load({ paths = lpath .. "/laravel-blade" })
		--require("luasnip.loaders.from_vscode").load({ paths = lpath .. "/laravel-blade2" })
		--require("luasnip.loaders.from_vscode").load({ paths = lpath .. "/laravel5" })
		--require("luasnip.loaders.from_vscode").load({ paths = lpath .. "/javascript" })
		--require("luasnip.loaders.from_vscode").load({ paths = lpath .. "/html" })
		--require("luasnip.loaders.from_vscode").load({ paths = lpath .. "/codeigniter4" })
		--require("luasnip.loaders.from_vscode").load({ paths = lpath .. "/font-awesome" })
		--require("luasnip.loaders.from_vscode").load({ paths = lpath .. "/javascript-snippet" })
	end,
}
