return {
	"folke/tokyonight.nvim", -- A clean, dark Neovim theme written in Lua
	lazy = false,
	priority = 1000,
	config = function()
		-- Variable to set true | false
		local is_transparent_config = true

		-- Function to config tokyonight
		local function update_config()
			require("tokyonight").setup({

				style = "night",
				light_style = "day",
				transparent = is_transparent_config,
				terminal_colors = false,
				styles = {
					comments = { italic = true },
					keywords = { italic = true },
					functions = {},
					variables = {},
					sidebars = is_transparent_config and "transparent" or "none",
					floats = is_transparent_config and "transparent" or "none",
				},
				sidebars = { "qf", "help" },
				day_brightness = 0.3,
				hide_inactive_statusline = false,
				dim_inactive = false,
				lualine_bold = false,
			})

			-- Reload theme
			vim.cmd([[colorscheme tokyonight-night]])

			-- Reload colors for alpha.lua whenever reload theme
			vim.api.nvim_command("highlight AlphaHeader guifg=#7aa2f7 guibg=NONE")
			vim.api.nvim_command("highlight AlphaButtons guifg=#bb9af7 guibg=NONE")
			vim.api.nvim_command("highlight AlphaPadding guifg=#1b1f24 guibg=NONE")
		end

		update_config()

		function _TOGGLE_TRANSPARENT()
			is_transparent_config = not is_transparent_config
			update_config()
		end

		vim.keymap.set("n", "<leader>tt", ":lua _TOGGLE_TRANSPARENT()<CR>", { noremap = true, silent = true })
	end,
}
