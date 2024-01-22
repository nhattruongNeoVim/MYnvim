return {
	"NeogitOrg/neogit",
	event = "VimEnter",
	dependencies = {
		"sindrets/diffview.nvim", -- optional - Diff integration
	},
	config = function()
		local icons = require("core.icons")
		require("neogit").setup({
			disable_signs = false,
			disable_context_highlighting = false,
			disable_commit_confirmation = true,
			disable_insert_on_commit = "auto",
			auto_refresh = true,
			disable_builtin_notifications = false,
			use_magit_keybindings = false,
			kind = "tab",
			commit_popup = {
				kind = "split",
			},
			popup = {
				kind = "split",
			},
			signs = {
				section = { icons.ui.ChevronRight, icons.ui.ChevronShortDown },
				item = { icons.ui.ChevronRight, icons.ui.ChevronShortDown },
				hunk = { "", "" },
			},
			integrations = {
				diffview = true,
			},
		})
	end,
}
