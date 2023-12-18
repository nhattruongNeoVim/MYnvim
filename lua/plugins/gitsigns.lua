return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local gitsigns = require("gitsigns")
		gitsigns.setup({
			signs = {
				delete = { text = "" },
				topdelete = { text = "" },
			},
		})
	end,
}
