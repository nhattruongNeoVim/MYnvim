return {
	"folke/tokyonight.nvim", -- A clean, dark Neovim theme written in Lua
	lazy = false,
	priority = 1000,
	config = function()
		-- Variable to set true | false
		local is_transparent = false

		-- Function to config tokyonight
		local function update_config()
			require("tokyonight").setup({
				style = "night",
				light_style = "day",
				transparent = is_transparent,
				terminal_colors = false,
				styles = {
					comments = { italic = true },
					keywords = { italic = true },
					functions = {},
					variables = {},
					sidebars = is_transparent and "transparent" or "dark",
					floats = is_transparent and "transparent" or "dark",
				},
				sidebars = { "qf", "help" },
				day_brightness = 0.3,
				hide_inactive_statusline = false,
				dim_inactive = false,
				lualine_bold = false,

				on_colors = function(c)
					c.c1 = "#9d7cd8"
					c.c2 = "#7aa2f7"
					c.c3 = "#fc1a70"
					c.c4 = "#9049d8"
				end,

				on_highlights = function(hl, c)
					hl.AlphaHeader = {
						fg = c.c2,
					}
					hl.AlphaButtons = {
						fg = c.c1,
					}
					hl.FloatBorder = {
						fg = c.c4,
					}
					hl.FloatTitle = {
						fg = c.c4,
					}
					hl.TelescopeBorder = {
						fg = c.c4,
					}
				end,
			})

			-- Load theme
			vim.cmd([[colorscheme tokyonight-night]])
		end

		update_config()

		function _TOGGLE_TRANSPARENT()
			is_transparent = not is_transparent
			update_config()
		end

		vim.keymap.set("n", "<leader>tt", ":lua _TOGGLE_TRANSPARENT()<CR>", { noremap = true, silent = true })
	end,
}
