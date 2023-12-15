return {
	"akinsho/bufferline.nvim",
	event = "VimEnter",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"famiu/bufdelete.nvim",
	},
	version = "*",
	config = function()
		local bufferline = require("bufferline")

		bufferline.setup({
			options = {
				hover = {
					enabled = true,
					delay = 200,
					reveal = { "close" },
				},
				offsets = {
					{
						filetype = "NvimTree",
						text = "nhật trường",
						highlight = "Directory",
						text_align = "center",
						separator = true,
					},
				},
				always_show_bufferline = false,
				tabpage_offset = 2, -- Độ lệch giữa các tab
				buffer_close_icon = "", -- Biểu tượng đóng buffer
				modified_icon = "", -- Biểu tượng cho các buffer đã thay đổi
				close_icon = "", -- Biểu tượng đóng tab
				left_trunc_marker = "", -- Biểu tượng hiển thị khi tên buffer quá dài bên trái
				right_trunc_marker = "", -- Biểu tượng hiển thị khi tên buffer quá dài bên phải
				-- separator_style = "slant" | "slope" | "thick" | "thin" | { 'any', 'any' },
				indicator = {
					icon = "▎", -- this should be omitted if indicator style is not 'icon'
					style = "none", -- this should be omitted if indicator style is
					-- style = 'icon' | 'underline' | 'none',
				},
				diagnostics = "nvim_lsp",
				diagnostics_indicator = function(count, level, diagnostics_dict, context)
					return "(" .. count .. ")"
				end,
			},
		})

		vim.keymap.set("n", "<tab>", ":BufferLineCycleNext<CR>", { noremap = true, silent = true })
		vim.keymap.set("n", "<S-tab>", ":BufferLineCyclePrev<CR>", { noremap = true, silent = true })
	end,
}
