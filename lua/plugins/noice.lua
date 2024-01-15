return {
	"folke/noice.nvim",
	event = "VimEnter",
	dependencies = {
		"MunifTanjim/nui.nvim",
		"rcarriga/nvim-notify",
	},
	config = function()
		local noice = require("noice")
		local notify = require("notify")

		notify.setup({
			background_colour = "NotifyBackground",
			fps = 90,
			icons = {
				DEBUG = "",
				ERROR = "",
				INFO = "",
				TRACE = "✎",
				WARN = "",
			},
			level = 2,
			minimum_width = 50, -- minimum width of notify
			render = "default", -- include: "default", "minimal", "simple", "compact"
			stages = "fade_in_slide_out", -- include: "fade_in_slide_out", "fade", "slide", "static"
			timeout = 1000,
			top_down = true,
		})

		noice.setup({
			multigrid = false,
			cmdline = {
				enabled = true,
				view = "cmdline_popup", -- include: "cmdline_popup", "cmdline"
				format = {
					cmdline = { pattern = "^:", icon = "", lang = "vim" },
					search_down = { kind = "search", pattern = "^/", icon = " ", lang = "regex" },
					search_up = { kind = "search", pattern = "^%?", icon = " ", lang = "regex" },
					filter = { pattern = "^:%s*!", icon = "$", lang = "bash" },
					lua = { pattern = { "^:%s*lua%s+", "^:%s*lua%s*=%s*", "^:%s*=%s*" }, icon = "", lang = "lua" },
					help = { pattern = "^:%s*he?l?p?%s+", icon = "" },
					input = {}, -- Used by input()
					-- lua = false, -- to disable a format, set to `false`
				},
			},
			messages = {
				enabled = true, -- enables the Noice messages UI
				view = "notify", -- default view for messages include: "cmdline_popup", "cmdline", "notify", "split"
				view_error = "notify", -- view for messages
				view_warn = "notify", -- view for errors
				view_history = "messages", -- view for :messages
				view_search = "virtualtext", -- view for search count messages. Set to `false` to disable
			},
			popupmenu = {
				enabled = true, -- enables the Noice popupmenu UI
				backend = "nui", -- backend to use to show regular cmdline completions, include: 'nui'|'cmp'
				-- Icons for completion item kinds (see defaults at noice.config.icons.kinds)
				kind_icons = {}, -- set to `false` to disable icons
			},
			redirect = {
				view = "popup",
				filter = { event = "msg_show" },
			},
			commands = {
				history = {
					-- options for the message history that you get with `:Noice`
					view = "split",
					opts = { enter = true, format = "details" },
					filter = {
						any = {
							{ event = "notify" },
							{ error = true },
							{ warning = true },
							{ event = "msg_show", kind = { "" } },
							{ event = "lsp", kind = "message" },
						},
					},
				},
				-- :Noice last
				last = {
					view = "popup",
					opts = { enter = true, format = "details" },
					filter = {
						any = {
							{ event = "notify" },
							{ error = true },
							{ warning = true },
							{ event = "msg_show", kind = { "" } },
							{ event = "lsp", kind = "message" },
						},
					},
					filter_opts = { count = 1 },
				},
				-- :Noice errors
				errors = {
					-- options for the message history that you get with `:Noice`
					view = "popup",
					opts = { enter = true, format = "details" },
					filter = { error = true },
					filter_opts = { reverse = true },
				},
			},
			notify = {
				enabled = true,
				view = "notify",
			},
			lsp = {
				progress = {
					enabled = true,
					format = "lsp_progress",
					format_done = "lsp_progress_done",
					throttle = 1000 / 30,
					view = "mini",
				},
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = false,
					["vim.lsp.util.stylize_markdown"] = false,
					["cmp.entry.get_documentation"] = false,
				},
				hover = {
					enabled = true,
					silent = false, -- set to true to not show a message if hover is not available
					view = nil, -- when nil, use defaults from documentation
					opts = {}, -- merged with defaults from documentation
				},
				signature = {
					enabled = true,
					auto_open = {
						enabled = true,
						trigger = true, -- Automatically show signature help when typing a trigger character from the LSP
						luasnip = true, -- Will open signature help when jumping to Luasnip insert nodes
						throttle = 50, -- Debounce lsp signature help request by 50ms
					},
					view = nil, -- when nil, use defaults from documentation
					opts = {}, -- merged with defaults from documentation
				},
				message = {
					-- Messages shown by lsp servers
					enabled = true,
					view = "notify",
					opts = {},
				},
				-- defaults for hover and signature help
				documentation = {
					view = "hover",
					opts = {
						lang = "markdown",
						replace = true,
						render = "plain",
						format = { "{message}" },
						win_options = { concealcursor = "n", conceallevel = 3 },
					},
				},
			},
			markdown = {
				hover = {
					["|(%S-)|"] = vim.cmd.help, -- vim help links
					["%[.-%]%((%S-)%)"] = require("noice.util").open, -- markdown links
				},
				highlights = {
					["|%S-|"] = "@text.reference",
					["@%S+"] = "@parameter",
					["^%s*(Parameters:)"] = "@text.title",
					["^%s*(Return:)"] = "@text.title",
					["^%s*(See also:)"] = "@text.title",
					["{%S-}"] = "@parameter",
				},
			},
			health = {
				checker = true, -- Disable if you don't want health checks to run
			},
			smart_move = {
				-- noice tries to move out of the way of existing floating windows.
				enabled = true, -- you can disable this behaviour here
				-- add any filetypes here, that shouldn't trigger smart move.
				excluded_filetypes = { "cmp_menu", "cmp_docs", "notify" },
			},
			presets = {
				bottom_search = false, -- use a classic bottom cmdline for search
				command_palette = true, -- position the cmdline and popupmenu together
				long_message_to_split = true, -- long messages will be sent to a split
				inc_rename = false, -- enables an input dialog for inc-rename.nvim
				lsp_doc_border = false, -- add a border to hover docs and signature help
			},
			throttle = 1000 / 30, -- how frequently does Noice need to check for ui updates? This has no effect when in blocking mode.
			views = {},
			routes = {},
			status = {},
			format = {},
		})
	end,
}
