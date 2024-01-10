return {
	"nvim-tree/nvim-web-devicons", -- dev icons
	config = function()
		local devicons = require("nvim-web-devicons")
		devicons.setup({
			override_by_filename = {
				[".gitignore"] = {
					icon = "",
					color = "#f1502f",
					name = "Gitignore",
				},
			},
		})
	end,
}
