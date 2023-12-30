return {
	"folke/tokyonight.nvim", -- theme tokyonight
	lazy = false,
	priority = 1000,
	opt = {},
	config = function()
		require("tokyonight").setup({
			style = "night",
			light_style = "day",
			-- transparent = true,
			transparent = false,
			terminal_colors = false,
			styles = {
				comments = { italic = true },
				keywords = { italic = true },
				functions = {},
				variables = {},
				sidebars = "transparent",
				floats = "transparent",
			},
			sidebars = { "qf", "help" },
			day_brightness = 0.3,
			hide_inactive_statusline = false,
			dim_inactive = false,
			lualine_bold = false,

			---@param colors ColorScheme
			on_colors = function(colors) end,

			---@param highlights Highlights
			---@param colors ColorScheme
			on_highlights = function(highlights, colors) end,
		})

		vim.cmd([[colorscheme tokyonight-night]])
	end,
}
