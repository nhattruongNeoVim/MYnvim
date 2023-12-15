return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-buffer", -- source for text in buffer
		"hrsh7th/cmp-path", -- source for file system paths
		"hrsh7th/cmp-nvim-lua", -- source for cmp
		"hrsh7th/cmp-nvim-lsp", -- source for cmp
		"hrsh7th/cmp-cmdline", -- source for cmpline
		{
			"tzachar/cmp-tabnine", -- source from AI
			build = "./install.sh",
		},
		"L3MON4D3/LuaSnip", -- snippet engine
		"saadparwaiz1/cmp_luasnip", -- for autocompletion
		"rafamadriz/friendly-snippets", -- useful snippets
		"onsails/lspkind.nvim", -- vs-code like pictograms
	},
	config = function()
		local cmp = require("cmp")

		local luasnip = require("luasnip")

		local lspkind = require("lspkind")

		local new_kind_icon = require("core.icons")

		-- loads vscode style snippets from installed plugins (e.g. friendly-snippets)
		require("luasnip.loaders.from_vscode").lazy_load()

		vim.opt.completeopt = "menu,menuone,noselect"

		cmp.setup({
			-- completion = {
			-- 	completeopt = "menu,menuone,preview,noselect",
			-- },
			snippet = { -- configure how nvim-cmp interacts with snippet engine
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
				{ name = "cmp_tabnine" }, -- TabNine
				{ name = "nvim_lsp" }, -- lsp
				{ name = "nvim_lua" }, -- lsp
				{ name = "luasnip" }, -- snippets
				{ name = "buffer" }, -- text within current buffer
				{ name = "path" }, -- file system paths
			}),
			-- configure lspkind for vs-code like pictograms in completion menu
			-- formatting = {
			--     format = lspkind.cmp_format({
			--         maxwidth = 50,
			--         ellipsis_char = "...",
			--     }),
			-- },
			formatting = {
				fields = { "kind", "abbr", "menu" },
				format = function(entry, vim_item)
					-- vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
					vim_item.kind = string.format("%s", new_kind_icon["kind"][vim_item.kind])
					-- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
					vim_item.menu = ({
						-- nvim_lsp = "[LSP]",
						-- luasnip = "[Snippet]",
						-- buffer = "[Buffer]",
						-- path = "[Path]",
						nvim_lsp = "(LSP)",
						luasnip = "(Snippet)",
						buffer = "(Buffer)",
						path = "(Path)",
					})[entry.source.name]
					return vim_item
				end,
			},
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},
		})
	end,
}
