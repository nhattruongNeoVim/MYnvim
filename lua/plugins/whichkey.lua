---@diagnostic disable: param-type-mismatch
return {
	"folke/which-key.nvim",
	lazy = false,
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 200
	end,
	config = function()
		local which_key = require("which-key")

		-- config for utils
		function _LAZYGIT_TOGGLE()
			local Terminal = require("toggleterm.terminal").Terminal
			local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })
			lazygit:toggle()
		end

		function _NODE_TOGGLE()
			local Terminal = require("toggleterm.terminal").Terminal
			local node = Terminal:new({ cmd = "node", hidden = true })
			node:toggle()
		end

		function _HTOP_TOGGLE()
			local Terminal = require("toggleterm.terminal").Terminal
			local htop = Terminal:new({ cmd = "htop", hidden = true })
			htop:toggle()
		end

		function _BTOP_TOGGLE()
			local Terminal = require("toggleterm.terminal").Terminal
			local htop = Terminal:new({ cmd = "btop", hidden = true })
			htop:toggle()
		end

		local setup = {
			plugins = {
				marks = true,
				registers = true,
				spelling = {
					enabled = true,
					suggestions = 20,
				},
				presets = {
					operators = false,
					motions = true,
					text_objects = true,
					windows = true,
					nav = true,
					z = true,
					g = true,
				},
			},
			key_labels = {
				-- override the label used to display some keys. It doesn't effect WK in any other way.
				-- For example:
				-- ["<space>"] = "SPC",
				-- ["<cr>"] = "RET",
				-- ["<tab>"] = "TAB",
			},
			icons = {
				breadcrumb = "»",
				separator = "➜",
				group = "+",
			},
			popup_mappings = {
				scroll_down = "<c-d>",
				scroll_up = "<c-u>",
			},
			window = {
				border = "rounded",
				position = "bottom",
				margin = { 1, 0, 1, 0 },
				padding = { 2, 2, 2, 2 },
				winblend = 0,
			},
			layout = {
				height = { min = 4, max = 25 },
				width = { min = 20, max = 50 },
				spacing = 6,
				align = "left",
			},
			ignore_missing = true,
			hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " },
			show_help = true,
			triggers = "auto",
			triggers_nowait = {
				-- marks
				"`",
				"'",
				"g`",
				"g'",
				-- registers
				'"',
				"<c-r>",
				-- spelling
				"z=",
			},
			triggers_blacklist = {
				i = { "j", "k" },
				v = { "j", "k" },
			},
		}
		local opts = { mode = "n", prefix = "<leader>", buffer = nil, silent = true, noremap = true, nowait = true }
		local opts2 = { mode = "v", prefix = "<leader>", buffer = nil, silent = true, noremap = true, nowait = true }

		local mappings2 = {
			["/"] = { "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>", "Comment" },
		}

		local mappings = {
			a = { "<cmd>Alpha<cr>", "Alpha" },
			z = { "<cmd>set wrap!<CR>", "Wrap" },
			x = { "<cmd>Bdelete!<CR>", "Close" },
			e = { "<cmd>NvimTreeToggle<cr>", "Expl" },
			w = { "<cmd>w!<CR>", "Save" },
			q = { "<cmd>qall!<CR>", "Exit" },
			n = { "<cmd>nohlsearch<CR>", "Nohl" },
			["/"] = { "<cmd>lua require 'Comment.api'.toggle.linewise.current()<cr>", "Comment" },

			f = {
				name = "Find",
				f = { "<cmd>Telescope find_files<CR>", "Find files" },
				o = { "<cmd>Telescope oldfiles<cr>", "Find oldfiles" },
				b = { "<cmd>Telescope marks<cr>", "Find bookmarks" },
				w = { "<cmd>Telescope live_grep theme=ivy<cr>", "Find words" },
			},

			o = {
				name = "Lazy",
				o = { "<cmd>Lazy home<cr>", "Open" },
				i = { "<cmd>Lazy install<cr>", "Install" },
				s = { "<cmd>Lazy sync<cr>", "Sync" },
				S = { "<cmd>Lazy clear<cr>", "Status" },
				c = { "<cmd>Lazy clean<cr>", "Clean" },
				u = { "<cmd>Lazy update<cr>", "Update" },
				p = { "<cmd>Lazy profile<cr>", "Profile" },
				l = { "<cmd>Lazy log<cr>", "Log" },
				d = { "<cmd>Lazy debug<cr>", "Debug" },
			},

			l = {
				name = "LSP",
				a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
				d = { "<cmd>Telescope diagnostics bufnr=0<cr>", "Document Diagnostics" },
				W = { "<cmd>Telescope diagnostics<cr>", "Workspace Diagnostics" },
				f = { "<cmd>lua vim.lsp.buf.format{async=true}<cr>", "Format" },
				i = { "<cmd>LspInfo<cr>", "Info" },
				m = { "<cmd>Mason<CR>", "Mason" },
				j = { "<cmd>Lspsaga diagnostic_jump_next<CR>", "Next Diagnostic" },
				k = { "<cmd>Lspsaga diagnostic_jump_prev<cr>", "Prev Diagnostic" },
				l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
				q = { "<cmd>lua vim.diagnostic.setloclist()<cr>", "Quickfix" },
				r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
				p = { "<cmd>Lspsaga peek_definition<cr>", "Peek definition" },
				w = { "<cmd>Lspsaga winbar_toggle<cr>", "Winbar toggle" },
				g = { "<cmd>Lspsaga goto_definition<cr>", "Go to definition" },
				s = { "<cmd>Lspsaga show_line_diagnostics<cr>", "Show diagnostics" },
				o = { "<cmd>Lspsaga outline<cr>", "Show outine" },
				F = { "<cmd>Lspsaga finder<cr>", "Show finder" },
			},

			h = {
				name = "Help",
				t = { "<cmd>Telescope colorscheme<cr>", "Themes" },
				h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
				k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
				c = { "<cmd>Telescope commands<cr>", "Commands" },
			},

			g = {
				name = "Git",
				g = { "<cmd>lua _LAZYGIT_TOGGLE()<CR>", "Lazygit" },
				t = { "<cmd>Gitsigns toggle_signs<CR>", "Toggle" },
				j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
				k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
				l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
				p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
				r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
				R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
				s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
				u = { "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>", "Undo Stage Hunk" },
				o = { "<cmd>Telescope git_status theme=ivy<cr>", "Open changed file" },
				b = { "<cmd>Telescope git_branches theme=ivy<cr>", "Checkout branch" },
				c = { "<cmd>Telescope git_commits theme=ivy<cr>", "Checkout commit" },
				d = { "<cmd>Gitsigns diffthis HEAD<cr>", "Diff" },
			},

			r = {
				name = "Run",
				s = {
					'<cmd>autocmd bufwritepost [^_]*.sass,[^_]*.scss  silent exec "!sass %:p %:r.css"<CR>',
					"Auto Compile Sass",
				},
				r = { "<cmd>RunCode<CR>", "Run Code" },
				f = { "<cmd>RunFile<CR>", "Run File" },
				p = { "<cmd>RunProject<CR>", "Run Project" },
			},

			s = {
				name = "Split wd",
				v = { "<C-w>v", "Vertical" },
				h = { "<C-w>s", "Horizontal" },
				e = { "<C-w>=", "Default size" },
				x = { "<cmd>close<CR>", "Close window" },
				m = { "<cmd>MaximizerToggle<CR>", "Maximum window size" },
			},

			t = {
				name = "Syntax hl",
				e = { "<cmd>TSBufEnable highlight<CR>", "Enable highlight" },
				d = { "<cmd>TSBufDisable highlight<CR>", "Disable highlight" },
			},

			u = {
				name = "Utils",
				n = { "<cmd>lua _NODE_TOGGLE()<cr>", "Node" },
				h = { "<cmd>lua _HTOP_TOGGLE()<cr>", "Htop" },
				b = { "<cmd>lua _BTOP_TOGGLE()<cr>", "Btop" },
				t = { "<cmd>lua _TOGGLE_TRANSPARENT()<cr>", "Transparent (tokyonight)" },
				m = { "<cmd>MinimapToggle<cr>", "Minimap" },
			},

			j = {
				name = "Hop",
				j = { "<cmd>HopWord<cr>", "Hop word" },
				a = { "<cmd>HopAnywhere<cr>", "Hop all" },
				c = { "<cmd>HopChar1<cr>", "Hop char" },
				l = { "<cmd>HopLine<cr>", "Hop line" },
				s = { "<cmd>HopLineStart<cr>", "Hop line start" },
				p = { "<cmd>HopPattern<cr>", "Hop arbitrary" },
			},

			b = {
				name = "Buffer",
				a = { "<cmd>lua require 'harpoon.mark'.add_file()<cr>", "Add buffer" },
				b = { "<cmd>lua require 'harpoon.ui'.toggle_quick_menu()<cr>", "UI" },
				["1"] = { "<cmd>lua require 'harpoon.ui'.nav_file(1)<cr>", "Buffer 1" },
				["2"] = { "<cmd>lua require 'harpoon.ui'.nav_file(2)<cr>", "Buffer 2" },
				["3"] = { "<cmd>lua require 'harpoon.ui'.nav_file(3)<cr>", "Buffer 3" },
				["4"] = { "<cmd>lua require 'harpoon.ui'.nav_file(4)<cr>", "Buffer 4" },
				["5"] = { "<cmd>lua require 'harpoon.ui'.nav_file(5)<cr>", "Buffer 5" },
				["6"] = { "<cmd>lua require 'harpoon.ui'.nav_file(6)<cr>", "Buffer 6" },
				["7"] = { "<cmd>lua require 'harpoon.ui'.nav_file(7)<cr>", "Buffer 7" },
				["8"] = { "<cmd>lua require 'harpoon.ui'.nav_file(8)<cr>", "Buffer 8" },
			},

			d = {
				name = "Debug",
				b = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Toggle Breakpoint" },
				c = { "<cmd>lua require'dap'.continue()<cr>", "Start/Continue" },
				x = { "<cmd>lua require'dap'.clear_breakpoints()<cr>", "Clear Breakpoint" },
				i = { "<cmd>lua require'dap'.step_into()<cr>", "Step Into" },
				t = { "<cmd>lua require'dap'.step_back()<cr>", "Step Back" },
				d = { "<cmd>lua require'dap'.disconnect()<cr>", "Disconnect" },
				g = { "<cmd>lua require'dap'.session()<cr>", "Get Session" },
				o = { "<cmd>lua require'dap'.step_over()<cr>", "Step Over" },
				s = { "<cmd>lua require'dap'.step_out()<cr>", "Step Out" },
				p = { "<cmd>lua require'dap'.pause()<cr>", "Pause" },
				r = { "<cmd>lua require'dap'.repl.toggle()<cr>", "Toggle Repl" },
				q = { "<cmd>lua require'dap'.close()<cr>", "Quit" },
				u = { "<cmd>lua require'dapui'.toggle({reset = true})<cr>", "Toggle UI" },
			},

			p = {
				name = "Play games",
				["1"] = { "<cmd>KillKillKill<cr>", "Killersheep" },
				["2"] = { "<cmd>SnakeStart<cr>", "Snake" },
				["3"] = { "<cmd>VimBeGood<cr>", "VimBeGood" },
				["4"] = { "<cmd>Tetris<cr>", "Tetris" },
			},
		}

		which_key.setup(setup)
		which_key.register(mappings, opts) -- Normal mode
		which_key.register(mappings2, opts2) -- Visual mode
	end,
}
